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