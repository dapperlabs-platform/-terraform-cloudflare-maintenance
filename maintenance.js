const approvelist = APPROVELIST_IPS.split(',');

addEventListener("fetch", event => {
    event.respondWith(fetchAndReplace(event.request))
})

async function fetchAndReplace(request) {
    let modifiedHeaders = new Headers()
    modifiedHeaders.set('Content-Type', 'text/html')
    modifiedHeaders.append('Pragma', 'no-cache')

    //Allow users from trusted into site
    if (approvelist.indexOf(request.headers.get("cf-connecting-ip")) > -1) {
        return fetch(request)
    } else { //Return maintanence for all other users
        return new Response(body, {
            status: 503,
            headers: modifiedHeaders
        })
    }
}

const body = `${content}`;