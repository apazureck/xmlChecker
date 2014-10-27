
## xmlChecker tests

Author: Jan Gottschick

To test the xmlChecker ...

Importing the Jasmine test framework addons to describe the specifications by
examples.

		require 'jasmine-matchers'
		require 'jasmine-given'

		xmlChecker = require '../lib/xmlCheckerModule'

		compile = (__done, __expr, __test, __debug = false) ->
			try
				__code = xmlChecker.parse(__expr)
			catch error
				console.log error.name + " at " + error.line + "," + error.column + ": " + error.message if __debug
				__test false, ''
				__done()
				return
			__test true, __code
			__done()

And the tests...

		describe 'A XML file', ->

			it 'should be accept a minimal header', (done) ->
				compile done, '''
					<?xml version="1.1" ?>
				''', (ok, result) ->
					expect(ok).toBe true