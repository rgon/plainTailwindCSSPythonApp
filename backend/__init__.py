from aiohttp import web

routes = web.RouteTableDef()

@routes.get('/')
async def hello(request):
    return web.Response(text="API server ok")

@routes.get('/hello')
async def hello(request):
    return web.Response(text="Hello, world")

app = web.Application()
app.add_routes(routes)

if __name__ == '__main__':
    print('Starting server on port 3001')
    web.run_app(app, port=3001)