// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "trix"
import "@rails/actiontext"

// Adding skelton to the product
document.addEventListener("DOMContentLoaded", function () {
    setTimeout(() => {
        document.querySelectorAll(".product-card").forEach(card => {
            card.classList.remove("skeleton-effect");

            const realImg = card.querySelector(".real-img");
            const placeholder = card.querySelector(".img-placeholder");

            if (realImg && placeholder) {
                realImg.classList.remove("d-none");
                placeholder.remove();
            }
        });
    }, 1500); // Simulate backend loading
});


// Heart react for favorites products

// Toggle wishlist heart icon
document.querySelectorAll('.wishlist-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        this.classList.toggle('active');
        const icon = this.querySelector('i');
        if (icon.classList.contains('bi-heart')) {
            icon.classList.remove('bi-heart');
            icon.classList.add('bi-heart-fill');
        } else {
            icon.classList.remove('bi-heart-fill');
            icon.classList.add('bi-heart');
        }
    });
});

// Filter buttons active state
document.querySelectorAll('.filter-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
        this.classList.add('active');
    });
});

// Simple script to handle thumbnail clicks
document.querySelectorAll('.thumbnail').forEach(thumb => {
    thumb.addEventListener('click', function() {
        // Update main image
        document.querySelector('.product-image-main').src = this.src;

        // Update active thumbnail
        document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
        this.classList.add('active');
    });
});

// Slider for showing categories
document.addEventListener('DOMContentLoaded', function() {
    const scrollContainer = document.getElementById('categoriesScroll');
    const scrollLeftBtn = document.getElementById('scrollLeft');
    const scrollRightBtn = document.getElementById('scrollRight');

    scrollLeftBtn.addEventListener('click', function() {
        scrollContainer.scrollBy({
            left: -300,
            behavior: 'smooth'
        });
    });

    scrollRightBtn.addEventListener('click', function() {
        scrollContainer.scrollBy({
            left: 300,
            behavior: 'smooth'
        });
    });

    // Add touch swipe support for mobile
    let touchStartX = 0;
    let touchEndX = 0;

    scrollContainer.addEventListener('touchstart', e => {
        touchStartX = e.changedTouches[0].screenX;
    }, false);

    scrollContainer.addEventListener('touchend', e => {
        touchEndX = e.changedTouches[0].screenX;
        handleSwipe();
    }, false);

    function handleSwipe() {
        if (touchStartX - touchEndX > 50) {
            // Swipe left
            scrollContainer.scrollBy({
                left: 300,
                behavior: 'smooth'
            });
        }

        if (touchEndX - touchStartX > 50) {
            // Swipe right
            scrollContainer.scrollBy({
                left: -300,
                behavior: 'smooth'
            });
        }
    }
});