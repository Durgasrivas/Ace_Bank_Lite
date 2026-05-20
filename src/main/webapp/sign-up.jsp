<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up | AceBank</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="icon" type="image/svg+xml" href="${pageContext.request.contextPath}/favicon.svg">
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css">
        <style>
            .signup-page {
                background: linear-gradient(135deg, #060d16, #0a1628, #0f2027) !important;
                background-size: 400% 400% !important;
                animation: suGrad 12s ease infinite !important;
            }

            @keyframes suGrad {
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

            #su-particles {
                position: fixed;
                inset: 0;
                z-index: 0;
                pointer-events: none;
            }

            .su-orb {
                position: fixed;
                border-radius: 50%;
                filter: blur(90px);
                opacity: 0.3;
                z-index: 0;
                pointer-events: none;
            }

            .su-orb-1 {
                width: 420px;
                height: 420px;
                background: radial-gradient(circle, #7b2ff7, transparent 70%);
                top: -100px;
                left: -60px;
                animation: sOrb1 14s ease-in-out infinite;
            }

            .su-orb-2 {
                width: 350px;
                height: 350px;
                background: radial-gradient(circle, #00c6ff, transparent 70%);
                bottom: 5%;
                right: -80px;
                animation: sOrb2 18s ease-in-out infinite;
            }

            .su-orb-3 {
                width: 260px;
                height: 260px;
                background: radial-gradient(circle, #00ffa3, transparent 70%);
                top: 50%;
                left: 10%;
                animation: sOrb3 20s ease-in-out infinite;
            }

            @keyframes sOrb1 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(50px, 70px) scale(1.08);
                }
            }

            @keyframes sOrb2 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(-60px, -50px) scale(1.1);
                }
            }

            @keyframes sOrb3 {

                0%,
                100% {
                    transform: translate(0, 0) scale(1);
                }

                50% {
                    transform: translate(40px, 60px) scale(1.05);
                }
            }

            /* Three-column layout */
            .signup-page .auth-wrapper {
                display: flex;
                gap: 50px;
                align-items: center;
                justify-content: center;
                z-index: 2;
                position: relative;
            }

            .signup-page .auth-card {
                animation: suCardGlow 4s ease-in-out infinite alternate;
            }

            @keyframes suCardGlow {
                0% {
                    box-shadow: 0 25px 60px rgba(0, 0, 0, 0.6);
                }

                100% {
                    box-shadow: 0 25px 80px rgba(123, 47, 247, 0.18), 0 0 60px rgba(0, 198, 255, 0.08);
                }
            }

            .su-side-visual {
                width: 260px;
                flex-shrink: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 16px;
            }

            .su-side-left {
                animation: suSlideLeft 1s 0.2s ease both;
            }

            .su-side-right {
                animation: suSlideRight 1s 0.4s ease both;
            }

            @keyframes suSlideLeft {
                from {
                    opacity: 0;
                    transform: translateX(-40px);
                }

                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            @keyframes suSlideRight {
                from {
                    opacity: 0;
                    transform: translateX(40px);
                }

                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            /* Growth Chart (LEFT) */
            .bank-growth {
                width: 140px;
                height: 140px;
                border-radius: 50%;
                background: linear-gradient(135deg, #0a1628, #1a2d4a);
                border: 3px solid rgba(123, 47, 247, 0.25);
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                animation: growFloat 5s ease-in-out infinite;
                box-shadow: 0 20px 50px rgba(0, 0, 0, 0.4), 0 0 30px rgba(123, 47, 247, 0.1);
            }

            .bank-growth::before {
                content: "";
                position: absolute;
                inset: 8px;
                border-radius: 50%;
                border: 2px dashed rgba(123, 47, 247, 0.15);
                animation: gSpin 20s linear infinite;
            }

            .bank-growth::after {
                content: "";
                position: absolute;
                width: 12px;
                height: 12px;
                background: #00ffa3;
                border-radius: 50%;
                box-shadow: 0 0 12px rgba(0, 255, 163, 0.5);
                top: -6px;
                left: 50%;
                transform-origin: 0 76px;
                animation: dotOrbit 6s linear infinite;
            }

            .bank-growth i {
                font-size: 48px;
                color: #7b2ff7;
                filter: drop-shadow(0 0 15px rgba(123, 47, 247, 0.4));
            }

            @keyframes gSpin {
                to {
                    transform: rotate(360deg);
                }
            }

            @keyframes growFloat {

                0%,
                100% {
                    transform: translateY(0);
                }

                50% {
                    transform: translateY(-15px);
                }
            }

            @keyframes dotOrbit {
                to {
                    transform: rotate(360deg);
                }
            }

            .su-chip-row {
                display: flex;
                gap: 8px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .su-chip {
                background: rgba(123, 47, 247, 0.06);
                border: 1px solid rgba(123, 47, 247, 0.15);
                padding: 6px 12px;
                border-radius: 8px;
                font-size: 11px;
                font-weight: 600;
                color: rgba(255, 255, 255, 0.7);
                display: flex;
                align-items: center;
                gap: 5px;
                animation: suChipIn 0.5s ease both;
            }

            .su-chip:nth-child(1) {
                animation-delay: 0.5s;
            }

            .su-chip:nth-child(2) {
                animation-delay: 0.7s;
            }

            .su-chip:nth-child(3) {
                animation-delay: 0.9s;
            }

            .su-chip i {
                color: #b57aff;
                font-size: 14px;
            }

            @keyframes suChipIn {
                from {
                    opacity: 0;
                    transform: translateY(8px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* Transaction Receipt (RIGHT) */
            .su-receipt {
                width: 200px;
                background: linear-gradient(135deg, #0a1628, #1a2d4a);
                border: 1px solid rgba(123, 47, 247, 0.2);
                border-radius: 14px;
                padding: 18px 16px;
                position: relative;
                overflow: hidden;
                animation: rcFloat 5s ease-in-out infinite;
                box-shadow: 0 16px 40px rgba(0, 0, 0, 0.4), 0 0 25px rgba(123, 47, 247, 0.08);
            }

            .su-receipt::before {
                content: "";
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: linear-gradient(45deg, transparent 30%, rgba(123, 47, 247, 0.05) 40%, rgba(255, 255, 255, 0.06) 50%, rgba(123, 47, 247, 0.05) 60%, transparent 70%);
                animation: rcShim 4s ease-in-out infinite;
            }

            @keyframes rcShim {
                0% {
                    transform: translateX(-100%) rotate(25deg);
                }

                100% {
                    transform: translateX(100%) rotate(25deg);
                }
            }

            @keyframes rcFloat {

                0%,
                100% {
                    transform: translateY(0) rotate(1deg);
                }

                50% {
                    transform: translateY(-10px) rotate(-1deg);
                }
            }

            .rc-hd {
                font-size: 10px;
                color: rgba(255, 255, 255, 0.4);
                letter-spacing: 1.5px;
                text-transform: uppercase;
                margin-bottom: 12px;
                font-weight: 600;
            }

            .rc-amt {
                font-size: 26px;
                font-weight: 800;
                color: #00ffa3;
                margin-bottom: 4px;
            }

            .rc-desc {
                font-size: 11px;
                color: rgba(255, 255, 255, 0.5);
                margin-bottom: 14px;
            }

            .rc-stat {
                display: flex;
                align-items: center;
                gap: 6px;
                font-size: 10px;
                color: #00ffa3;
                font-weight: 600;
            }

            .rc-dot {
                width: 8px;
                height: 8px;
                border-radius: 50%;
                background: #00ffa3;
                box-shadow: 0 0 8px #00ffa3;
                animation: rcPulse 1.5s ease-in-out infinite;
            }

            @keyframes rcPulse {

                0%,
                100% {
                    opacity: 1;
                    transform: scale(1);
                }

                50% {
                    opacity: 0.5;
                    transform: scale(0.7);
                }
            }

            .rc-bar {
                height: 4px;
                border-radius: 2px;
                background: rgba(255, 255, 255, 0.06);
                margin-top: 10px;
                overflow: hidden;
            }

            .rc-bar-fill {
                height: 100%;
                width: 0;
                border-radius: 2px;
                background: linear-gradient(90deg, #7b2ff7, #00ffa3);
                animation: rcBarFill 2s 1s ease-out forwards;
            }

            @keyframes rcBarFill {
                to {
                    width: 100%;
                }
            }

            .su-badge {
                position: absolute;
                padding: 4px 10px;
                border-radius: 8px;
                font-size: 10px;
                font-weight: 700;
                color: white;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            }

            .sb-1 {
                background: linear-gradient(135deg, #7b2ff7, #b57aff);
                top: -8px;
                right: -8px;
                animation: sbFloat 3s ease-in-out infinite;
            }

            .sb-2 {
                background: linear-gradient(135deg, #00ffa3, #00c853);
                bottom: -6px;
                left: 10px;
                animation: sbFloat 3.5s 0.5s ease-in-out infinite;
            }

            @keyframes sbFloat {

                0%,
                100% {
                    transform: translateY(0) scale(1);
                }

                50% {
                    transform: translateY(-8px) scale(1.1);
                }
            }

            /* Floating symbols */
            .su-float {
                position: absolute;
                font-size: 18px;
                font-weight: 800;
                opacity: 0.12;
                z-index: 0;
            }

            .sf1 {
                top: 8%;
                right: 10%;
                color: #7b2ff7;
                animation: sf 7s ease-in-out infinite;
            }

            .sf2 {
                top: 30%;
                left: 5%;
                color: #00c6ff;
                animation: sf 6s 1s ease-in-out infinite;
            }

            .sf3 {
                bottom: 20%;
                right: 15%;
                color: #00ffa3;
                animation: sf 8s 2s ease-in-out infinite;
            }

            .sf4 {
                bottom: 10%;
                left: 10%;
                color: #ffb347;
                animation: sf 5s 0.5s ease-in-out infinite;
            }

            @keyframes sf {

                0%,
                100% {
                    transform: translateY(0) rotate(0deg);
                }

                50% {
                    transform: translateY(-20px) rotate(-15deg);
                }
            }

            @media (max-width: 1100px) {
                .su-side-visual {
                    display: none;
                }
            }
        </style>
    </head>

    <body class="signup-page">
        <canvas id="su-particles"></canvas>
        <div class="su-orb su-orb-1"></div>
        <div class="su-orb su-orb-2"></div>
        <div class="su-orb su-orb-3"></div>
        <div class="su-float sf1">🏦</div>
        <div class="su-float sf2">💳</div>
        <div class="su-float sf3">📈</div>
        <div class="su-float sf4">🔐</div>

        <div class="auth-wrapper">

            <!-- LEFT: Growth Chart Animation -->
            <div class="su-side-visual su-side-left">
                <div class="bank-growth">
                    <i class="ri-line-chart-line"></i>
                </div>
                <h3 style="color:white; font-size:18px; font-weight:700; text-align:center;">
                    Start Your <span style="color:#b57aff;">Journey</span>
                </h3>
                <p style="color:rgba(255,255,255,0.45); font-size:12px; text-align:center; line-height:1.6;">
                    Open your free account in under 2 minutes.
                </p>
                <div class="su-chip-row">
                    <div class="su-chip"><i class="ri-timer-flash-line"></i> 2 min</div>
                    <div class="su-chip"><i class="ri-money-dollar-circle-line"></i> Free</div>
                    <div class="su-chip"><i class="ri-smartphone-line"></i> Mobile</div>
                </div>
            </div>

            <!-- CENTER: Sign-up Form -->
            <div class="auth-card">
                <h2 style="text-align:center; margin-bottom:10px;">Create Account</h2>
                <div style="text-align:center; margin-bottom:25px;">
                    <h1 style="font-weight:700; font-size:28px;">
                        Ace<span style="color:#00c6ff;">Bank</span>
                    </h1>
                </div>

                <% if (request.getParameter("error") != null) { %>
                <div style="background:rgba(255,70,70,0.12); border:1px solid rgba(255,70,70,0.35); color:#ff6b6b; padding:12px 16px; border-radius:10px; font-size:13px; font-weight:500; margin-bottom:18px; text-align:center; display:flex; align-items:center; justify-content:center; gap:8px;">
                    <i class="ri-error-warning-line" style="font-size:16px;"></i>
                    <%= request.getParameter("error") %>
                </div>
                <% } %>

                <form action="signup" method="POST" id="signup-form">

                    <div class="signup-name-row">
                        <div class="form-control">
                            <label><i class="ri-user-line" style="margin-right:4px;"></i> First Name</label>
                            <input type="text" name="firstName" id="firstName" placeholder="First Name" required>
                        </div>
                        <div class="form-control">
                            <label><i class="ri-user-line" style="margin-right:4px;"></i> Last Name</label>
                            <input type="text" name="lastName" id="lastName" placeholder="Last Name" required>
                        </div>
                    </div>
                    <div class="form-control">
                        <label><i class="ri-fingerprint-line" style="margin-right:4px;"></i> Aadhar Number</label>
                        <input type="text" name="aadharNumber" id="aadharNumber" placeholder="12-digit Aadhar Number"
                            required>
                    </div>
                    <div class="form-control">
                        <label><i class="ri-mail-line" style="margin-right:4px;"></i> Email Address</label>
                        <input type="email" name="email" id="email" placeholder="Email Address" required>
                    </div>
                    <div class="form-control">
                        <label><i class="ri-lock-password-line" style="margin-right:4px;"></i> Password</label>
                        <input type="password" name="password" id="password" placeholder="Min. 10 characters" required>
                    </div>
                    <button type="submit" id="submit-btn"><i class="ri-user-add-line"></i> CREATE ACCOUNT</button>
                </form>

                <p style="text-align:center; margin-top:18px;">
                    Already have an account? <a href="login.jsp">Login</a>
                </p>
                <p style="text-align:center;">
                    <a href="ForgotPassword.jsp">Forgot your password?</a>
                </p>
            </div>

            <!-- RIGHT: Transaction Receipt Animation -->
            <div class="su-side-visual su-side-right">
                <div style="position:relative; display:inline-block;">
                    <div class="su-receipt">
                        <div class="rc-hd">Transaction Complete</div>
                        <div class="rc-amt">₹25,000</div>
                        <div class="rc-desc">Instant Transfer • Today</div>
                        <div class="rc-stat">
                            <div class="rc-dot"></div>
                            Success
                        </div>
                        <div class="rc-bar">
                            <div class="rc-bar-fill"></div>
                        </div>
                    </div>
                    <div class="su-badge sb-1">NEW</div>
                    <div class="su-badge sb-2">✓ Verified</div>
                </div>
                <h3 style="color:white; font-size:18px; font-weight:700; text-align:center;">
                    Instant <span style="color:#00ffa3;">Transfers</span>
                </h3>
                <p style="color:rgba(255,255,255,0.45); font-size:12px; text-align:center; line-height:1.6;">
                    Send money anywhere in seconds with zero fees.
                </p>
            </div>

        </div>

        <script src="${pageContext.request.contextPath}/js/style.js"></script>
        <script>
            (function () {
                var c = document.getElementById('su-particles'); if (!c) return;
                var ctx = c.getContext('2d'), w, h, pts = [], N = 60, D = 120;
                function resize() { w = c.width = innerWidth; h = c.height = innerHeight; }
                function init() { pts = []; for (var i = 0; i < N; i++)pts.push({ x: Math.random() * w, y: Math.random() * h, vx: (Math.random() - 0.5) * 0.5, vy: (Math.random() - 0.5) * 0.5, r: Math.random() * 2 + 1 }); }
                function draw() { ctx.clearRect(0, 0, w, h); for (var i = 0; i < pts.length; i++)for (var j = i + 1; j < pts.length; j++) { var dx = pts[i].x - pts[j].x, dy = pts[i].y - pts[j].y, d = Math.sqrt(dx * dx + dy * dy); if (d < D) { ctx.strokeStyle = 'rgba(123,47,247,' + (1 - d / D) * 0.2 + ')'; ctx.lineWidth = 0.7; ctx.beginPath(); ctx.moveTo(pts[i].x, pts[i].y); ctx.lineTo(pts[j].x, pts[j].y); ctx.stroke(); } } for (var p of pts) { ctx.beginPath(); ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2); ctx.fillStyle = 'rgba(123,47,247,0.4)'; ctx.fill(); p.x += p.vx; p.y += p.vy; if (p.x < 0 || p.x > w) p.vx *= -1; if (p.y < 0 || p.y > h) p.vy *= -1; } requestAnimationFrame(draw); }
                addEventListener('resize', function () { resize(); init(); }); resize(); init(); draw();
            })();
        </script>
    </body>

    </html>