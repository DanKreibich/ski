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

// export { autocompleteSearch };





// const autocompleteSearch = function() {
//   const skills = JSON.parse(document.getElementById('search-data').dataset.skills)
//   const searchInput = document.getElementById('q');

//   if (skills && searchInput) {
//     new autocomplete({
//       selector: searchInput,
//       minChars: 1,
//       source: function(term, suggest){
//           term = term.toLowerCase();
//           const choices = skills;
//           const matches = [];
//           for (let i = 0; i < choices.length; i++)
//               if (~choices[i].toLowerCase().indexOf(term)) matches.push(choices[i]);
//           suggest(matches);
//       },
//     });
//   }
// };

// export { autocompleteSearch };
