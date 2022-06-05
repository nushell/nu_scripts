<h1 align="center">Nushell Scripts</h1>
<div align="center">
	<a href="https://github.com/nushell/nu_scripts/issues">
		<img src="https://img.shields.io/github/issues/nushell/nu_scripts?label=Issues">
	</a>
	<img src="https://img.shields.io/github/issues-pr/nushell/nu_scripts?color=brightgreen">
	<img src="https://img.shields.io/github/stars/nushell/nu_scripts?color=yellow&label=Stars">
	<img src="https://img.shields.io/badge/Scripts-{{scriptcount}}*-blue" title="Some scripts are excluded." alt="Badge that shows there are {{scriptcount}} scripts">
</div>
<br>

This is a place to share Nushell scripts with each other. If you'd like to share your scripts, create a PR that adds it to the repo.

## Running Scripts

You can run Nushell scripts in a few different ways.

1. You can type `nu <script name>`.
2. From with nushell, you can type `source <script name>` and if the script is just a bunch of commands it will run the script. If the script is a custom command it will load those custom commands into your current scope so you can run them like any other command.

## Scripts

{{scripts_list}}
