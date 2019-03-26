p)import base64, json, requests
p)url = 'https://ephemeral.api.factom.com/v1'
p)headers = {"Content-Type": "application/json", "app_id": "","app_key": ""}


p)def verifyCredentials(): 
  r = requests.get(url, headers=headers)
  return r.json()


p)def createChain(externalIDs,content):
  endpoint = 'chains'
  externalIDs_encoded = [base64.b64encode(x.encode()).decode() for x in externalIDs];
  content_encoded = base64.b64encode(content.encode()).decode()
  payload = {"external_ids":externalIDs_encoded,"content":content_encoded}
  r = requests.post(url+endpoint, headers=headers, data=json.dumps(payload))
  return r.json()


p)def createEntry(externalIDs,content,chainID):
  endpoint = 'chains/'+chainID+'/entries'
  externalIDs_encoded = [base64.b64encode(x.encode()).decode() for x in externalIDs];
  content_encoded = base64.b64encode(content.encode()).decode()
  payload = {"external_ids":externalIDs_encoded,"content":content_encoded}
  r = requests.post(url+endpoint, headers=headers, data=json.dumps(payload))
  return r.json()


p)def getEntry(chainID,entryHash):
  endpoint = 'chains/'+chainID+'/entries/'+entryHash
  r = requests.get(url+endpoint, headers=headers)
  return r.json()


p)def getEntryByHref(Href):
  if url.endswith('v1/'):
    cuturl = url[:-3]
  r = requests.get(cuturl+Href, headers=headers)
  return r.json()


p)def createEntryWithCallback(externalIDs,content,chainID,callbackURL,callbackStages):
  endpoint = 'chains/'+chainID+'/entries'
  externalIDs_encoded = [base64.b64encode(x.encode()).decode() for x in externalIDs];
  content_encoded = base64.b64encode(content.encode()).decode()
  payload = {"external_ids":externalIDs_encoded,"content":content_encoded,"callback_url":callbackURL,"callback_stages":callbackStages}
  r = requests.post(url+endpoint, headers=headers,data=payload )
  return r.json()


p)def getEntries(chainID,limit="50",offset="0"):
  endpoint = 'chains/'+chainID+'/entries'
  querystring = {"offset":offset,"limit":limit}
  r = requests.get(url+endpoint, headers=headers,params=querystring )
  return r.json()


p)def getLastEntry(chainID):
  endpoint = 'chains/'+chainID+'/entries/last'
  r = requests.get(url+endpoint, headers=headers)
  return r.json()


p)def getFirstEntry(chainID):
  endpoint = 'chains/'+chainID+'/entries/first'
  r = requests.get(url+endpoint, headers=headers)
  return r.json()


p)def decoder(Str):
  return base64.b64decode(Str.encode()).decode('ascii')


p)def encoder(Str):
 return  base64.b64encode(Str.encode()).decode()


q).qfactom.verifyCredentials:.p.get[`verifyCredentials;<]
q).qfactom.createChain:.p.get[`createChain;<]
q).qfactom.createEntry:.p.get[`createEntry;<]
q).qfactom.createEntryWithCallback:.p.get[`createEntryWithCallback;<]
q).qfactom.getEntry:.p.get[`getEntry;<]
q).qfactom.getEntryByHref:.p.get[`getEntryByHref;<]
q).qfactom.getEntries:.p.get[`getEntries;<]
q).qfactom.getLastEntry:.p.get[`getLastEntry;<]
q).qfactom.getFirstEntry:.p.get[`getFirstEntry;<]
q).qfactom.decoder:.p.get[`decoder;<]
q).qfactom.encoder:.p.get[`encoder;<]
