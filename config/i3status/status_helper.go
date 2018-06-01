package main

// An ad-hoc tool to add some status fields to the output of i3status

import (
	"bufio"
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
	"strconv"
	"strings"
)

func ReadLines() <-chan string {
	out := make(chan string)
	scanner := bufio.NewScanner(os.Stdin)
	go func() {
		for scanner.Scan() {
			line := scanner.Text()
			out <- line

			if err := scanner.Err(); err != nil {
				break
			}
		}
		close(out)
	}()
	return out
}

func ProcessLines(in <-chan string) <-chan string {
	out := make(chan string)
	go func() {
		header := 2
		leadingComma := false
		for line := range in {
			if header > 0 {
				// first two lines are headers, send them on
				header -= 1
				out <- line
			} else {
				out <- ProcessLine(line, leadingComma)
				leadingComma = true
			}
		}
		close(out)
	}()
	return out
}

func PrintLines(in <-chan string) {
	for line := range in {
		fmt.Println(line)
	}
}

func ProcessLine(text string, leadingComma bool) string {
	// Don't bother decoding the JSON, just skip the initial [ or ,[
	to_skip := 1
	if leadingComma {
		// skip leading comma and [
		to_skip = 2
	}
	prefix := text[:to_skip]
	text = text[to_skip:]

	text = FormatBrightness() + "," + text

	return prefix + text
}

func GetBrightness() int {
	out, err := exec.Command("xbacklight", "-get").Output()
	if err != nil {
		fmt.Fprintln(os.Stderr, "command error:", err)
		return -1
	}
	b, err := strconv.Atoi(strings.TrimSpace(string(out)))
	if err != nil {
		fmt.Fprintln(os.Stderr, "strconv error:", err)
		return -1
	}
	return b
}

func FormatBrightness() string {
	var brightness string
	brightness = fmt.Sprintf("Brightness %d%%", GetBrightness())

	bMap := map[string]string{"name": "brightness", "full_text": brightness}
	response, err := json.Marshal(bMap)
	if err != nil {
		return "-"
	}
	return string(response)
}

func main() {
	PrintLines(ProcessLines(ReadLines()))
}
