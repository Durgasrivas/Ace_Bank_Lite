<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login | AceBank</title>
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
            <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/favicon.svg">
            <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css">
            <style>
                .login-page {
                    background: linear-gradient(135deg, #060d16, #0a1628, #0f2027) !important;
                    background-size: 400% 400% !important;
                    animation: authGrad 12s ease infinite !important;
                }

                @keyframes authGrad {
                    0% {
                        background-position: 0% 50%;
                    }

                    50% {
                        background-position: 100% 50%;
                    }

                    100% {
                        background-position: 0% 50%;
                    }
                }

                #auth-particles {
                    position: fixed;
                    inset: 0;
                    z-index: 0;
                    pointer-events: none;
                }

                .auth-orb {
                    position: fixed;
                    border-radius: 50%;
                    filter: blur(90px);
                    opacity: 0.3;
                    z-index: 0;
                    pointer-events: none;
                }

                .auth-orb-1 {
                    width: 400px;
                    height: 400px;
                    background: radial-gradient(circle, #00c6ff, transparent 70%);
                    top: -80px;
                    right: -60px;
                    animation: aOrb1 14s ease-in-out infinite;
                }

                .auth-orb-2 {
                    width: 350px;
                    height: 350px;
                    background: radial-gradient(circle, #7b2ff7, transparent 70%);
                    bottom: 5%;
                    left: -80px;
                    animation: aOrb2 18s ease-in-out infinite;
                }

                .auth-orb-3 {
                    width: 260px;
                    height: 260px;
                    background: radial-gradient(circle, #00ffa3, transparent 70%);
                    top: 55%;
                    right: 10%;
                    animation: aOrb3 20s ease-in-out infinite;
                }

                @keyframes aOrb1 {

                    0%,
                    100% {
                        transform: translate(0, 0) scale(1);
                    }

                    50% {
                        transform: translate(-50px, 70px) scale(1.08);
                    }
                }

                @keyframes aOrb2 {

                    0%,
                    100% {
                        transform: translate(0, 0) scale(1);
                    }

                    50% {
                        transform: translate(60px, -50px) scale(1.1);
                    }
                }

                @keyframes aOrb3 {

                    0%,
                    100% {
                        transform: translate(0, 0) scale(1);
                    }

                    50% {
                        transform: translate(-40px, 60px) scale(1.05);
                    }
                }

                /* Three-column layout: left anim | form | right anim */
                .login-page .auth-wrapper {
                    display: flex;
                    gap: 50px;
                    align-items: center;
                    justify-content: center;
                    z-index: 2;
                    position: relative;
                }

                .login-page .auth-card {
                    animation: authCardGlow 4s ease-in-out infinite alternate;
                }

                @keyframes authCardGlow {
                    0% {
                        box-shadow: 0 25px 60px rgba(0, 0, 0, 0.6);
                    }

                    100% {
                        box-shadow: 0 25px 80px rgba(0, 198, 255, 0.18), 0 0 60px rgba(123, 47, 247, 0.08);
                    }
                }

                /* Side visual panels */
                .auth-side-visual {
                    width: 260px;
                    flex-shrink: 0;
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    gap: 16px;
                }

                .auth-side-left {
                    animation: sideSlideLeft 1s 0.2s ease both;
                }

                .auth-side-right {
                    animation: sideSlideRight 1s 0.4s ease both;
                }

                @keyframes sideSlideLeft {
                    from {
                        opacity: 0;
                        transform: translateX(-40px);
                    }

                    to {
                        opacity: 1;
                        transform: translateX(0);
                    }
                }

                @keyframes sideSlideRight {
                    from {
                        opacity: 0;
                        transform: translateX(40px);
                    }

                    to {
                        opacity: 1;
                        transform: translateX(0);
                    }
                }

                /* Vault icon animation (LEFT) */
                .bank-vault {
                    width: 140px;
                    height: 140px;
                    border-radius: 50%;
                    background: linear-gradient(135deg, #0a1628, #1a2d4a);
                    border: 3px solid rgba(0, 198, 255, 0.25);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    position: relative;
                    animation: vaultFloat 5s ease-in-out infinite;
                    box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4), 0 0 30px rgba(0, 198, 255, 0.1);
                }

                .bank-vault::before {
                    content: "";
                    position: absolute;
                    inset: 8px;
                    border-radius: 50%;
                    border: 2px dashed rgba(0, 198, 255, 0.15);
                    animation: vaultSpin 20s linear infinite;
                }

                .bank-vault i {
                    font-size: 48px;
                    color: #00c6ff;
                    filter: drop-shadow(0 0 15px rgba(0, 198, 255, 0.4));
                }

                @keyframes vaultSpin {
                    to {
                        transform: rotate(360deg);
                    }
                }

                @keyframes vaultFloat {

                    0%,
                    100% {
                        transform: translateY(0);
                    }

                    50% {
                        transform: translateY(-15px);
                    }
                }

                .auth-chip-row {
                    display: flex;
                    gap: 8px;
                    flex-wrap: wrap;
                    justify-content: center;
                }

                .auth-chip {
                    background: rgba(0, 198, 255, 0.06);
                    border: 1px solid rgba(0, 198, 255, 0.15);
                    padding: 6px 12px;
                    border-radius: 8px;
                    font-size: 11px;
                    font-weight: 600;
                    color: rgba(255, 255, 255, 0.7);
                    display: flex;
                    align-items: center;
                    gap: 5px;
                    animation: chipIn 0.5s ease both;
                }

                .auth-chip:nth-child(1) {
                    animation-delay: 0.5s;
                }

                .auth-chip:nth-child(2) {
                    animation-delay: 0.7s;
                }

                .auth-chip:nth-child(3) {
                    animation-delay: 0.9s;
                }

                .auth-chip i {
                    color: #00c6ff;
                    font-size: 14px;
                }

                @keyframes chipIn {
                    from {
                        opacity: 0;
                        transform: translateY(8px);
                    }

                    to {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }

                /* Money Stack Animation (RIGHT) */
                .money-stack {
                    position: relative;
                    width: 200px;
                    height: 200px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }

                .money-note {
                    position: absolute;
                    width: 160px;
                    height: 70px;
                    border-radius: 10px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-weight: 800;
                    font-size: 24px;
                    color: white;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
                }

                .note-1 {
                    background: linear-gradient(135deg, #00c6ff, #0072ff);
                    transform: rotate(-8deg) translateY(-20px);
                    animation: noteFloat1 4s ease-in-out infinite;
                    z-index: 3;
                }

                .note-2 {
                    background: linear-gradient(135deg, #00ffa3, #00c853);
                    transform: rotate(4deg) translateY(0px);
                    animation: noteFloat2 4.5s 0.5s ease-in-out infinite;
                    z-index: 2;
                }

                .note-3 {
                    background: linear-gradient(135deg, #7b2ff7, #b57aff);
                    transform: rotate(-3deg) translateY(20px);
                    animation: noteFloat3 5s 1s ease-in-out infinite;
                    z-index: 1;
                }

                .note-symbol {
                    font-size: 14px;
                    opacity: 0.3;
                    position: absolute;
                    right: 14px;
                    top: 8px;
                }

                .note-label {
                    font-size: 9px;
                    opacity: 0.5;
                    position: absolute;
                    left: 14px;
                    bottom: 8px;
                    letter-spacing: 1px;
                    text-transform: uppercase;
                    font-weight: 600;
                }

                @keyframes noteFloat1 {

                    0%,
                    100% {
                        transform: rotate(-8deg) translateY(-20px);
                    }

                    50% {
                        transform: rotate(-5deg) translateY(-30px);
                    }
                }

                @keyframes noteFloat2 {

                    0%,
                    100% {
                        transform: rotate(4deg) translateY(0px);
                    }

                    50% {
                        transform: rotate(6deg) translateY(-12px);
                    }
                }

                @keyframes noteFloat3 {

                    0%,
                    100% {
                        transform: rotate(-3deg) translateY(20px);
                    }

                    50% {
                        transform: rotate(-1deg) translateY(10px);
                    }
                }

                /* Floating coins around money stack */
                .stack-coin {
                    position: absolute;
                    width: 34px;
                    height: 34px;
                    border-radius: 50%;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 16px;
                    font-weight: 800;
                    color: white;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
                    z-index: 4;
                }

                .sc-1 {
                    background: linear-gradient(135deg, #ffb347, #ff8c00);
                    top: 5%;
                    left: 0;
                    animation: scBounce 3s ease-in-out infinite;
                }

                .sc-2 {
                    background: linear-gradient(135deg, #ff4d6a, #ff6b6b);
                    bottom: 10%;
                    right: 5%;
                    animation: scBounce 3.5s 0.5s ease-in-out infinite;
                }

                .sc-3 {
                    background: linear-gradient(135deg, #00c6ff, #0072ff);
                    top: 15%;
                    right: 0;
                    animation: scBounce 4s 1s ease-in-out infinite;
                }

                @keyframes scBounce {

                    0%,
                    100% {
                        transform: translateY(0) rotate(0);
                    }

                    50% {
                        transform: translateY(-10px) rotate(10deg);
                    }
                }

                /* Floating currency symbols */
                .auth-float-coin {
                    position: absolute;
                    font-size: 18px;
                    font-weight: 800;
                    opacity: 0.15;
                    z-index: 0;
                }

                .fc1 {
                    top: 10%;
                    left: 8%;
                    color: #00c6ff;
                    animation: fc 6s ease-in-out infinite;
                }

                .fc2 {
                    top: 20%;
                    right: 12%;
                    color: #00ffa3;
                    animation: fc 7s 1s ease-in-out infinite;
                }

                .fc3 {
                    bottom: 25%;
                    left: 15%;
                    color: #7b2ff7;
                    animation: fc 8s 2s ease-in-out infinite;
                }

                .fc4 {
                    bottom: 15%;
                    right: 8%;
                    color: #ffb347;
                    animation: fc 5s 0.5s ease-in-out infinite;
                }

                @keyframes fc {

                    0%,
                    100% {
                        transform: translateY(0) rotate(0deg);
                    }

                    50% {
                        transform: translateY(-20px) rotate(15deg);
                    }
                }

                @media (max-width: 1100px) {
                    .auth-side-visual {
                        display: none;
                    }
                }
            </style>
        </head>

        <body class="login-page">
            <canvas id="auth-particles"></canvas>
            <div class="auth-orb auth-orb-1"></div>
            <div class="auth-orb auth-orb-2"></div>
            <div class="auth-orb auth-orb-3"></div>
            <div class="auth-float-coin fc1">₹</div>
            <div class="auth-float-coin fc2">$</div>
            <div class="auth-float-coin fc3">€</div>
            <div class="auth-float-coin fc4">£</div>

            <div class="auth-wrapper">

                <!-- LEFT: Vault Animation -->
                <div class="auth-side-visual auth-side-left">
                    <div class="bank-vault">
                        <i class="ri-shield-keyhole-line"></i>
                    </div>
                    <h3 style="color:white; font-size:18px; font-weight:700; text-align:center;">
                        Secure <span style="color:#00c6ff;">Banking</span>
                    </h3>
                    <p style="color:rgba(255,255,255,0.45); font-size:12px; text-align:center; line-height:1.6;">
                        Industry-grade encryption protects every transaction.
                    </p>
                    <div class="auth-chip-row">
                        <div class="auth-chip"><i class="ri-lock-2-line"></i> BCrypt</div>
                        <div class="auth-chip"><i class="ri-shield-check-line"></i> 2FA</div>
                        <div class="auth-chip"><i class="ri-time-line"></i> 24/7</div>
                    </div>
                </div>

                <!-- CENTER: Login Form -->
                <div class="auth-card">
                    <h2 style="text-align:center; margin-bottom:10px;">Login Account</h2>
                    <div style="text-align:center; margin-bottom:25px;">
                        <h1 style="font-weight:700; font-size:28px;">
                            Ace<span style="color:#00c6ff;">Bank</span>
                        </h1>
                    </div>

                    <% if (request.getParameter("success") !=null) { %>
                        <div
                            style="background:rgba(0,255,153,0.12); border:1px solid rgba(0,255,153,0.3); color:#00ff99; padding:12px 16px; border-radius:10px; font-size:13px; font-weight:500; margin-bottom:18px; text-align:center;">
                            <%= request.getParameter("success") %>
                        </div>
                        <% } %>

                        <% if (request.getParameter("error") != null) { %>
                        <div
                            style="background:rgba(255,70,70,0.12); border:1px solid rgba(255,70,70,0.35); color:#ff6b6b; padding:12px 16px; border-radius:10px; font-size:13px; font-weight:500; margin-bottom:18px; text-align:center; display:flex; align-items:center; justify-content:center; gap:8px;">
                            <i class="ri-error-warning-line" style="font-size:16px;"></i>
                            <%= request.getParameter("error") %>
                        </div>
                        <% } %>



                            <form action="Login" method="POST">
                                <div class="form-control">
                                    <label><i class="ri-bank-card-line" style="margin-right:4px;"></i> Account
                                        Number</label>
                                    <input type="text" name="accountNumber" value="${savedAccount}"
                                        placeholder="Enter Account Number" required>
                                </div>
                                <div class="form-control">
                                    <label><i class="ri-lock-password-line" style="margin-right:4px;"></i>
                                        Password</label>
                                    <input type="password" name="password" placeholder="Password" required>
                                </div>
                                <div style="margin:10px 0;">
                                    <input type="checkbox" name="rememberMe" ${not empty savedAccount ? 'checked' : ''
                                        }>
                                    Remember me
                                </div>
                                <button type="submit"><i class="ri-login-box-line"></i> LOGIN</button>
                            </form>

                            <p style="text-align:center; margin-top:18px;">
                                <a href="ForgotPassword.jsp">Forgot your password?</a>
                            </p>
                            <p style="text-align:center;">
                                Don't have an account? <a href="sign-up.jsp">Register</a>
                            </p>
                </div>

                <!-- RIGHT: Money Stack Animation -->
                <div class="auth-side-visual auth-side-right">
                    <div class="money-stack">
                        <div class="money-note note-1">
                            ₹2,000
                            <span class="note-symbol">₹</span>
                            <span class="note-label">AceBank</span>
                        </div>
                        <div class="money-note note-2">
                            ₹500
                            <span class="note-symbol">₹</span>
                            <span class="note-label">Reserve</span>
                        </div>
                        <div class="money-note note-3">
                            ₹100
                            <span class="note-symbol">₹</span>
                            <span class="note-label">Digital</span>
                        </div>
                        <div class="stack-coin sc-1">₹</div>
                        <div class="stack-coin sc-2">$</div>
                        <div class="stack-coin sc-3">€</div>
                    </div>
                    <h3 style="color:white; font-size:18px; font-weight:700; text-align:center;">
                        Smart <span style="color:#00ffa3;">Money</span>
                    </h3>
                    <p style="color:rgba(255,255,255,0.45); font-size:12px; text-align:center; line-height:1.6;">
                        Manage, send, and grow your wealth effortlessly.
                    </p>
                </div>

            </div>

            <script src="${pageContext.request.contextPath}/js/style.js"></script>
            <script>
                (function () {
                    var c = document.getElementById('auth-particles'); if (!c) return;
                    var ctx = c.getContext('2d'), w, h, pts = [], N = 60, D = 120;
                    function resize() { w = c.width = innerWidth; h = c.height = innerHeight; }
                    function init() { pts = []; for (var i = 0; i < N; i++)pts.push({ x: Math.random() * w, y: Math.random() * h, vx: (Math.random() - 0.5) * 0.5, vy: (Math.random() - 0.5) * 0.5, r: Math.random() * 2 + 1 }); }
                    function draw() { ctx.clearRect(0, 0, w, h); for (var i = 0; i < pts.length; i++)for (var j = i + 1; j < pts.length; j++) { var dx = pts[i].x - pts[j].x, dy = pts[i].y - pts[j].y, d = Math.sqrt(dx * dx + dy * dy); if (d < D) { ctx.strokeStyle = 'rgba(0,198,255,' + (1 - d / D) * 0.2 + ')'; ctx.lineWidth = 0.7; ctx.beginPath(); ctx.moveTo(pts[i].x, pts[i].y); ctx.lineTo(pts[j].x, pts[j].y); ctx.stroke(); } } for (var p of pts) { ctx.beginPath(); ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2); ctx.fillStyle = 'rgba(0,198,255,0.45)'; ctx.fill(); p.x += p.vx; p.y += p.vy; if (p.x < 0 || p.x > w) p.vx *= -1; if (p.y < 0 || p.y > h) p.vy *= -1; } requestAnimationFrame(draw); }
                    addEventListener('resize', function () { resize(); init(); }); resize(); init(); draw();
                })();
            </script>
        </body>

        </html>