[% INCLUDE includes/header.tpl %]

	<h1>[% "Services configured for group [_1]" | l10n(group_name) %]</h1>
	[% FOREACH service IN gs %]
	    [% IF loop.first %]
	    <table class="datatable">
		<thead>
		    <tr>
			<th>[% "Name" | l10n %]</th>
			<th>[% "Description" | l10n %]</th>
			<th>[% "Perl module" | l10n %]</th>
			<th>[% "del" | l10n %]</th>
		    </tr>
		</thead>
		<tbody>
	    [% END %]
		<tr class="[% loop.parity %]">
		    <td><a href="?rm=edit_group_service&gs_id=[% service.id %]">[% service.name %]</a></td>
		    <td>[% service.desc %]</td>
		    <td>[% service.class %]</td>
		    <td><a href="?rm=delete_group_service&gs_id=[% service.id %]">del</a></td>
		</tr>
	    [% IF loop.last %]
		</tbody>
		<tfoot></tfoot>
	    </table>
	    [% END %]
	[% END %]
	<a href="?rm=add_service&group_id=[% group_id %]">[% "New Service for this Group" | l10n %]</a><br />
	[% "This section lists all services configured for this group." | l10n %]
	<hr />
	
[% INCLUDE includes/footer.tpl %]
