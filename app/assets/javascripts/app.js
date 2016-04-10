'use strict';

var flashcardApp = angular.module('flashcardApp', [
	'templates',
	'ngRoute',
	'flashcardControllers'
]);

flashcardApp.config(['$routeProvider', function($routeProvider) {
	$routeProvider.when('/decks', {
		templateUrl: 'decks.html',
		controller: 'DecksCtrl'
	}).
	when('decks/:deckId', {
		templateUrl: 'poll.html',
		controller: 'PollCtrl'
	}).
	otherwise({
		redirectTo: '/decks'
	});
}]);