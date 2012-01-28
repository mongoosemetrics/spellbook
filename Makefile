SHELL:=/bin/bash

ME=`whoami`
ROOT="root"

install:
	@# Make sure we are running as root
	@if [ "$(ME)" != "$(ROOT)" ]; then \
		echo "Please run \"make install\" as root."; \
		exit 1; \
	fi
	@# Copy over the executable
	@cp spellbook.sh /usr/bin/spellbook
	@# Be sure the script is exectuable
	@chmod 777 /usr/bin/spellbook
	@# Copy over the bash completion script
	@cp bash_completion/spellbook /etc/bash_completion.d/spellbook

clean:
	@# Clean up everything
