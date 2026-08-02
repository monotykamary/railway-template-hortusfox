#!/usr/bin/env python3
import os,re,requests

base=os.environ['BASE_URL'].rstrip('/')
email=os.environ['ADMIN_EMAIL']
password=os.environ['ADMIN_PASSWORD']

def login(session, candidate):
    page=session.get(base+'/auth',timeout=30)
    assert page.status_code==200 and 'name="csrf_token"' in page.text and 'Railway Plants' in page.text
    token=re.search(r'name="csrf_token" value="([^"]+)"',page.text).group(1)
    return session.post(base+'/login',data={'csrf_token':token,'email':email,'password':candidate},allow_redirects=True,timeout=30)

bad=requests.Session()
failed=login(bad,'not-the-password')
assert '/auth' in failed.url and 'Railway Plants' in failed.text,failed.url

session=requests.Session()
success=login(session,password)
assert success.status_code==200 and '/auth' not in success.url,success.url
home=session.get(base+'/',timeout=30)
assert home.status_code==200 and 'Railway Plants' in home.text
print('HortusFox smoke checks passed')
