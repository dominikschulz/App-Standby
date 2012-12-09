[% INCLUDE includes/header.tpl %]

	<h1>[% "Contacts in group [_1]" | l10n(group_name) %]</h1>
	[% FOREACH line IN contacts %]
	    [% IF loop.first %]
	    <table class="datatable">
		<thead>
		    <tr>
			<th>[% "Name" | l10n %]</th>
			<th>[% "Cellphone" | l10n %]</th>
			<th>[% "act" | l10n %]</th>
			<th>[% "del" | l10n %]</th>
		    </tr>
		</thead>
		<tbody>
	    [% END %]
		<tr class="[% loop.parity %]">
		    <td><a href="?rm=edit_contact&contact_id=[% line.id %]&group_id=[% group_id %]">[% line.name %]</a></td>
		    <td>[% line.cellphone %]</td>
		    
		    [% IF line.is_enabled %]
		    <td class="green"><a href="?rm=disable_contact_ask&contact_id=[% line.id %]&group_id=[% group_id %]">dis</a></td>
		    [% ELSE %]
		    <td class="red"><a href="?rm=enable_contact_ask&contact_id=[% line.id %]&group_id=[% group_id %]">ena</a></td>
		    [% END %]
		    
		    <td><a href="?rm=delete_contact_ask&contact_id=[% line.id %]&group_id=[% group_id %]">del</a></td>
		</tr>
	    [% IF loop.last %]
		</tbody>
		<tfoot></tfoot>
	    </table>
	    [% END %]
	[% END %]
	<a href="?rm=add_contact&group_id=[% group_id %]">[% "Create new contact" | l10n %]</a>
	<br />
	
	[% "This is the list of contacts configured for this group." | l10n %]
	<hr />
[% INCLUDE includes/footer.tpl %]
