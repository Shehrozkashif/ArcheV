import webview

from globals import global_vars
from frontend.expose import expose

    
if __name__ == '__main__':
    global_vars['windows']['main'] = webview.create_window(
        title = 'ArcheV',
        url = 'frontend/web/index.html',
        width = 1200,
        height = 600,
        resizable = False,
    ) 
    webview.start(expose, global_vars['windows']['main'] )

