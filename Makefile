stack_name   := terraform-backend
stack_region := ap-southeast-2

# Colors for pretty printing.
color_none   := \033[0m
color_banner := \033[38;2;44;220;162m

## Function for printing a banner.
banner = \
	echo "\n$(color_banner)=====> $1$(color_none)"

.PHONY: deploy
deploy:
	@$(call banner,Deploying Terraform S3 backend stack)
	aws cloudformation deploy \
		--stack-name $(stack_name) \
		--template-file stack.yaml \
		--region $(stack_region) \
		--no-fail-on-empty-changeset \
		--profile playground
