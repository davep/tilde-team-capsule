site = site/
host = tilde

.PHONY: view
view:				# View the site in a browser.
	rogallo open $(site)/index.gmi

.PHONY: publish
publish:			# Publish the site.
	rsync -avvlHz --exclude=.DS_Store --exclude=.git --exclude=.gitignore --delete $(site)/ $(host):public_gemini

### Makefile ends here
