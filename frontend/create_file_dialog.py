import webview

from globals import global_vars


def open_file_dialog():
    return global_vars['windows']['main'].create_file_dialog(webview.OPEN_DIALOG)