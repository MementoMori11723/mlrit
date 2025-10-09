run:
	@cd docmost && make && cd -
	@cd n8n && make && cd - 
	@cd taiga && make && cd - 
	@cd caddy && make && cd -
stop:
	@cd caddy && make stop && cd -
	@cd taiga && make stop && cd - 
	@cd n8n && make stop && cd - 
	@cd docmost && make stop && cd -
