# -*- coding: utf-8 -*-
from django.core.management.base import BaseCommand, CommandError
from data.models import Game

class Command(BaseCommand):

	def add_arguments(self, parser):
		#parser.add_argument('fn_out', nargs='+', type=str)
		parser.add_argument('-g', '--game_id', type=int, default=1)

	def handle(self, *args, **options):
		game = Game.objects.get(pk=options['game_id'])
		
		out_fn = '{}.docx'.format(game.id)
		game.emit(out_fn)
