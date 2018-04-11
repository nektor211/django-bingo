from django.contrib import admin

import data.models as dm

@admin.register(dm.Text)
class TextAdmin(admin.ModelAdmin):
	pass

class TextInlineAdmin(admin.TabularInline):
	model = dm.Text
	extra = 0
	max_num = 0
	can_delete = False
	show_change_link = True

@admin.register(dm.Game)
class GameAdmin(admin.ModelAdmin):
	pass


@admin.register(dm.Placement)
class PlacementAdmin(admin.ModelAdmin):
	pass