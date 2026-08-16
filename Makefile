site = site/
host = tilde

.PHONY: view
view:				# View the site in a browser.
	uv run smolserve --config smolserve.toml exec rogallo open gemini://localhost/

.PHONY: rogallo
rogallo:			# Update the Rogallo ChangeLog
	@bin/update-rogallo-changelog > $(site)/rogallo/changelog.gmi

.PHONY: gemlog
gemlog:			# Update the Gemlog index
	bin/update-gemlog > $(site)/gemlog/index.gmi

.PHONY: publish
publish:			# Publish the site.
	rsync -avvlHz --exclude=.DS_Store --exclude=.git --exclude=.gitignore --delete $(site)/ $(host):public_gemini

### Makefile ends here
