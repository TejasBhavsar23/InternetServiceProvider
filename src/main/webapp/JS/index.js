document.addEventListener('DOMContentLoaded', function() {
    const dropdowns = document.querySelectorAll('.dropdown');
  
    dropdowns.forEach(dropdown => {
      dropdown.addEventListener('click', function() {
        // Close all other dropdowns
        dropdowns.forEach(item => {
          if (item !== dropdown) {
            item.classList.remove('active');
          }
        });
        // Toggle the clicked dropdown
        dropdown.classList.toggle('active');
      });
    });
  });
