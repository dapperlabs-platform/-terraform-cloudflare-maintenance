const allowlist = '${allowlistIPs}'.split(',');
const redirectURL = '${redirectURL}';
const statusCode = '${statusCode}';
const body = `${body}`;

const modifiedHeaders = new Headers([
  ['Content-Type', 'text/html'],
  ['Pragma', 'no-cache'],
]);

addEventListener('fetch', (event) => {
  event.respondWith(handleRequest(event.request));
});

async function handleRequest(request) {
  // Allow users from trusted into site
  if (allowlist.includes(request.headers.get('cf-connecting-ip'))) {
    return fetch(request);
  }

  // Redirect to external maintenance page if url is set
  if (redirectURL) {
    return Response.redirect(redirectURL, 307);
  }

  // Return maintenance html
  return new Response(body, {
    status: statusCode,
    headers: modifiedHeaders,
  });
}
