$(document).ready(function() {
    $("#multiple_choice_tag_list").select2({
        tags: true,
        ajax: {
            url: '/tags.json',
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    q: params.term,
                    page: params.page
                };
            },
            processResults: function (data, page) {
              var tags = data.map(function (t) {
                return {
                  id: t.name,
                  text: t.name
                };    
              });
              return {
                results: tags
              };
            },
            cache: true
        },
        minimumInputLength: 1
    });
});