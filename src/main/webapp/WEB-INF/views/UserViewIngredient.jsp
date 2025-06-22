<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Typing Effect for HTML Content</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    #typewriter {
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
      padding: 30px;
      max-width: 800px;
      width: 90%;
      box-sizing: border-box;
    }

    .section-title {
      font-weight: bold;
      margin-top: 20px;
    }

    ul {
      padding-left: 1.2rem;
    }

    h4, h5 {
      margin-bottom: 10px;
    }

    li {
      margin-bottom: 6px;
    }
  </style>
</head>
<body>

<div id="typewriter"></div>

<script>
  const content = `
  <h4>✅ <strong>${ingredient.name} – Caramel IV (Sulphite Ammonia Caramel)</strong></h4>

  <h5 class="section-title">🔍 Details:</h5>
  <ul>
    <li><strong>Full Name:</strong> Caramel Colour IV (Sulphite Ammonia Caramel)</li>
    <li><strong>Type:</strong> Food Colour (dark brown)</li>
    <li><strong>INS Number:</strong> 150d</li>
    <li><strong>E Number (Europe):</strong> E150d</li>
  </ul>

  <h5 class="section-title">🧪 How it's made:</h5>
  <ul>
    <li>Produced by <strong>heating sugar</strong> in the presence of <strong>ammonia and sulphite compounds</strong>.</li>
    <li>This gives it a <strong>very dark</strong> brown to black color, often used for cola-type drinks.</li>
  </ul>

  <h5 class="section-title">🍔 Common Uses:</h5>
  <ul>
    <li>Soft drinks (like <strong>cola</strong>)</li>
    <li>Beer</li>
    <li>Baked goods</li>
    <li>Soy sauce</li>
    <li>Chocolate syrup</li>
    <li>Ice cream</li>
    <li>Gravy or soup concentrates</li>
  </ul>

  <h5 class="section-title">⚠️ Health Note:</h5>
  <ul>
    <li>Considered safe in regulated quantities.</li>
    <li>People sensitive to <strong>sulphites or with asthma</strong> may experience reactions.</li>
    <li><strong>It’s not related to lemon.</strong></li>
  </ul>
  `;

  const container = document.getElementById('typewriter');
  let index = 0;

  function type() {
    container.innerHTML = content.slice(0, index);
    index++;
    if (index <= content.length) {
      setTimeout(type, 20);
    }
  }

  window.onload = type;
</script>

</body>
</html>
