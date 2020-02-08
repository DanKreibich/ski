// https://medium.com/lightthefuse/adding-autocomplete-suggestions-to-an-input-field-in-a-rails-application-with-webpack-b2a840a65087
import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function() {
  const resorts = JSON.parse(document.getElementById('search-data').dataset.resorts)
  console.log(resorts)
  const searchInput = document.getElementById('location');

  if (resorts && searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
          term = term.toLowerCase();
          const choices = resorts;
          const matches = [];
          for (let i = 0; i < choices.length; i++)
              if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
          suggest(matches);
      },
    });
  }
};

autocompleteSearch();
