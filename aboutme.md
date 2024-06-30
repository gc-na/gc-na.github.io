<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Chase Na - VLSI Engineer</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background: #000428;
            color: #ffffff;
        }
        .about-me {
            max-width: 1000px;
            margin: 0 auto;
            padding: 2rem;
        }
        .profile-container {
            text-align: center;
            margin-bottom: 2rem;
        }
        .profile-image {
            width: 250px;
            height: auto;
            border: 4px solid #4fc3f7;
            box-shadow: 0 0 15px rgba(79, 195, 247, 0.5);
        }
        h2, h3, h4 {
            color: #4fc3f7;
        }
        .content-container {
            max-width: 800px;
            margin: 0 auto;
        }
        .beliefs ul {
            list-style-type: none;
            padding-left: 0;
        }
        .beliefs li::before {
            content: "• ";
            color: #4fc3f7;
        }
        .vlsi-image, .book-image {
            max-width: 100%;
            border-radius: 5px;
            margin: 1rem 0;
        }
        .book-section ul {
            columns: 2;
            -webkit-columns: 2;
            -moz-columns: 2;
        }
        .contact-section a, .question-section a {
            color: #4fc3f7;
            text-decoration: none;
        }
        .contact-section a:hover, .question-section a:hover {
            text-decoration: underline;
        }
        @media (max-width: 600px) {
            .book-section ul {
                columns: 1;
                -webkit-columns: 1;
                -moz-columns: 1;
            }
        }
    </style>
</head>
<body>
    <section class="about-me">
        <div class="profile-container">
            <img src="/assets/img/IMG_5141.JPG" alt="Chase Na" class="profile-image">
            <h2>Chase Na, 나경채</h2>
            <h3>VLSI Engineer</h3>
        </div>
        
        <div class="content-container">
            <div class="beliefs">
                <h4>I believe</h4>
                <ul>
                    <li>Moore's Law is over, and all companies need their own "bespoke silicon".</li>
                    <li>Custom silicon should be made accessible to everyone in the most efficient way.</li>
                </ul>
            </div>

            <p>Hi there, this is Chase from VLSI Korea / VLSI Dictionary. I have a desire to achieve and share. Blogs are the closest medium to achieving these, so I am happily pursuing my hobby. As a bonus, I can show off how good our company's technology is :)</p>

            <div class="vlsi-explanation">
                <h4>What is VLSI?</h4>
                <p>My main research area is "Methodology for more efficient VLSI design" (Methodology = Performance + Power + Area + Development Cost Efficiency). VLSI in VLSI Korea stands for Very Large Scale Integrated Circuit.</p>
                <img src="/assets/img/aboutme1.png" alt="VLSI Chip" class="vlsi-image">
            </div>

            <p>I've been fortunate to experience ASIC Flow directly in areas such as design, verification, DFT, and Physical Design since my undergraduate years, connected with top semiconductor organizations. I've also experienced everything from MPW to mass production in the company. While I'm not yet an expert in this field, as you can see from my blog, I'm working hard every day without stopping.</p>

            <div class="book-section">
                <h4>Books I Often Reference</h4>
                <ul>
                    <li>Analog: Razavi, Electronics</li>
                    <li>EDA: Electronic Design Automation: Synthesis, Verification, and Test, Laung-TerngWang</li>
                    <li>Digital Design: Digital Design and Computer Architecture: ARM Edition, Sarah Harris</li>
                    <li>DFT: VLSI Test Principles and Architectures: Design for Testability, Laung-Terng Wang</li>
                    <li>SDC & STA: Constraining Designs for Synthesis and Timing Analysis: A Practical Guide to Synopsys Design Constraints (SDC), Sridhar Gangadharan</li>
                    <li>Low Power: An ASIC Low Power Primer, Chadha</li>
                    <li>Verification: System Verilog Assertions and Functional Coverage: Guide to Language, Methodology and Applications, Ashok B. Mehta</li>
                    <li>Liberty: Characterization and modeling of digital circuits, Rohit Sharma</li>
                </ul>
            </div>

            <div class="contact-section">
                <h4>Contact & Social</h4>
                <p>Email: <a href="mailto:gc@vlsi.kr">gc@vlsi.kr</a></p>
                <p>Since 2024, I only post on <a href="https://blog.naver.com/gc_na" target="_blank">NAVER Blog</a> to get NAVER influencer status.</p>
            </div>

            <div class="question-section">
                <h4>Have Questions?</h4>
                <p>Feel free to ask any semiconductor-related questions in the comments. I'll answer what I know and research what I don't to get back to you.</p>
            </div>
        </div>
    </section>
</body>
</html>
