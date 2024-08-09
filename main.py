import webview

from globals import windows


windows['main'] = webview.create_window(
    title='ArcheV',
    # url='frontend/web/splash.html',
    url='/home/shehroz/ArcheV/frontend/web/index.html',
    # url='frontend/web/tests.html',
    width=1200,
    height=600,
    resizable=False,
)
webview.start()

