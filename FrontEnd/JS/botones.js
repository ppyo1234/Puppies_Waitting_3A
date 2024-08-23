document.getElementById('openPage1').addEventListener('click', function() {
    window.open('pagina2.html', '_blank');
});

document.getElementById('openPage2').addEventListener('click', function() {
    window.open('catalogo.html', '_blank');
});

document.getElementById('opensesion').addEventListener('click', function() {
    window.open('pagina1.html', '_blank');
});


document.addEventListener('DOMContentLoaded', () => {
    const prevButton = document.querySelector('.prev');
    const nextButton = document.querySelector('.next');
    const carruselInner = document.querySelector('.carrusel-inner');
    const items = document.querySelectorAll('.carrusel-item');
    let index = 0;

    function showItem(index) {
        const offset = -index * 100;
        carruselInner.style.transform = `translateX(${offset}%)`;
    }

    prevButton.addEventListener('click', () => {
        index = (index > 0) ? index - 1 : items.length - 1;
        showItem(index);
    });

    nextButton.addEventListener('click', () => {
        index = (index < items.length - 1) ? index + 1 : 0;
        showItem(index);
    });

    // Optionally, add automatic sliding
    setInterval(() => {
        nextButton.click();
    }, 3000); // Cambia de imagen cada 3 segundos
});
