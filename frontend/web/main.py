
import  webview

windows = {}

windows['main'] = webview.create_window(
        title='ArcheV',
        # url='frontend/web/splash.html',
        url='/home/shehroz/Desktop/New Folder 1/frontend/index.html',
        # url='frontend/web/tests.html',
        width=1200,
        height=600,
        resizable=False,
    )
webview.start()

