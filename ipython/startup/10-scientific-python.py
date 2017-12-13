from __future__ import print_function
from importlib import import_module

from IPython.core.magic import register_line_magic


def safe_import(modname):
    try:
        return import_module(modname)
    except ImportError:
        print('Could not import {}'.format(modname))


@register_line_magic
def scipy_stack(line):
    np = safe_import('numpy')
    pd = safe_import('pandas')
    plt = safe_import('matplotlib.pyplot')
    globals().update({'np': np, 'pd': pd, 'plt': plt})
