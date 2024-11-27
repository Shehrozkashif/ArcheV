from frontend.index import analyze
from frontend.create_file_dialog import open_file_dialog


def expose(window):
    window.expose(
        open_file_dialog,
        analyze
    )