update/%:
	maltmill -w $*.rb

create/%:
	maltmill new -w ebi-yade/$*
