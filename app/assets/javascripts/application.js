// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require ckeditor/init
//= require cocoon
//= require bootstrap.min
//= require jquery-ui/sortable
//= require jquery-ui/effect-highlight

var toggleTooltip = function () {
    $("[data-toggle='tooltip']").tooltip();    
};

$(document).on('ready page:change', function() {
    toggleTooltip();
});

var reorder = function (sortableElement) {
    var fromIndex = 0;
    if(sortableElement.length > 0) {
        var table_width = sortableElement.width()
        var cells = $('.table').find('tr')[0].cells.length
        var desired_width = table_width / cells + 'px'
        $('.table td').css('width', desired_width)    
    }
        
    sortableElement.sortable({
        axis: 'y',
        items: '.sortable-item',
        cursor: 'move',
        start: function (e, ui) {
            fromIndex = ui.item.index();
        },
        stop: function (e, ui) {
            ui.item.children('td').effect('highlight', {}, 1000);   
        },
        update: function (e, ui) {
            var examId = ui.item.data('exam-id');
            var questionId = ui.item.data('question-id');
            var questionType = ui.item.data('question-type');
            $.ajax({
              type: 'PUT',
              url: '/exams/' + examId + '/orders',
              dataType: 'json',
              data: { from: fromIndex, to: ui.item.index(), 
                question_id: questionId, question_type: questionType }
            });
        }
    });
    sortableElement.disableSelection();    
};

$(document).on('ready page:change', function() {
    reorder($('#multiple-choice-questions'));
    reorder($('#essay-questions'));
});

