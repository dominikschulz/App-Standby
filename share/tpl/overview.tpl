[% INCLUDE includes/header.tpl %]
<div id="main">
	<h1>[% "Current notification order for Group [_1]" | l10n(group_name) %]</h1>
	
	[% FOREACH line IN ordered_contacts %]
	[% IF loop.first %]
	<table class="datatable">
		<thead>
			<tr>
				<th>[% "Slot" | l10n %]</th>
				<th>[% "Name" | l10n %]</th>
				<th>[% "Cellphone" | l10n %]</th>
			</tr>
		</thead>
		<tbody>
	[% END %]
	<tr>
		<td[% IF loop.first %] class="green"[% END %]>[% line.ordinal %]</td>
		<td[% IF loop.first %] class="green"[% END %]>[% line.name %]</td>
		<td[% IF loop.first %] class="green"[% END %]>[% line.cellphone %]</td>
	</tr>
	[% IF loop.last %]
		</tbody>
		<tfoot></tfoot>
	</table>
	[% END %]
	[% END %]

	<p>[% "This is the current notification order for the current group." | l10n %]</p>
	<p>[% "The person listed in slot 1 is currently on duty." | l10n %]</p>
	
	<hr />
	
	<h1>[% "Change janitor for group [_1]" | l10n(group_name) %]</h1>
	[% FOREACH line IN random_contacts %]
		[% IF loop.first %]
		<div class="forms">
			<form method="POST" action="">
				<input type="hidden" name="rm" value="update_janitor" />
				<input type="hidden" name="group_id" value="[% group_id %]" />
		
				<label for="janitor">
					[% "Janitor" | l10n %]:
					<span class="small"></span>
				</label>
				<select name="janitor">
		[% END %]
					<option value="[% line.id %]">[% line.name %]</option>
		[% IF loop.last %]
				</select>
		
				<div class="spacer"></div>
		
				<label for="group_key">
					[% "Group password" | l10n %]:
					<span class="small"></span>
				</label>
				<input type="text" name="group_key" value="" />
		
				<div class="spacer"></div>
		
				<button class="button" type="submit" name="submit">
					<img src="/icons/fffsilk/add.png" border="0" />
					[% "Change janitor" | l10n %]
				</button>
			</form>
		</div>
		[% END %]
	[% END %]
	
	<small><b>[% "Notice" | l10n %]:</b> [% "Disabled contacts won't be listed here!" | l10n %]</small>
	
	<p>[% "The selected contact will be set as the primary contact in all configured services." | l10n %]</p>
	
	<p>[% "This means that he will receive text messages and will be called first." | l10n %]</p>
	
	<p>[% "The contact which on duty before will be placed at the end of the notification list." | l10n %]</p>
	
	<h2>[% "Services which are configure for this group" | l10n %]:</h2>
	<ul>
	[% FOREACH name IN services.keys %]
		<li>[% services.$name.description %] ([% name %])</li>
	[% END %]
	</ul>
	
	<h2>[% "Important remarks" | l10n %]</h2>
	<ul>
		<li>[% "The pingdom service can't handle escalations. Only the primary contact is notified." | l10n %]</li>
	</ul>
</div>
[% INCLUDE includes/footer.tpl %]
