<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" />



    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2? family = Poppins: wght @ 200 & display = swap" rel="hoja de estilo">
    <style>
        @page {
            margin: 0px;
        }

        body {
            margin: 0px;
            font-family: Arial, Helvetica, sans-serif;
        }

        .hero-image {
            background-color: #cccccc;
            height: 615px;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }

        img {
            width: 100%;
            height: 102%;
        }

        .hero-text {
            text-align: center;
            position: absolute;
            top: 40%;
            left: 30%;
            transform: translate(-20%, -20%);
            color: white;
        }

        .header {
            text-align: center;
            position: absolute;
            top: 15%;
            left: 13%;
            color: white;
        }

        .firmas {
            text-align: center;
            position: absolute;
            top: 70%;
            left: 30%;
            width: 50%;
            color: white;
        }


        .nombres {
            text-align: center;
            position: absolute;
            top: 80%;
            left: 30%;
            width: 50%;
            color: white;
        }

        .cargos {
            text-align: center;
            position: absolute;
            top: 85%;
            left: 30%;
            width: 50%;
            color: white;
        }

        .codigo {
            text-align: right;
            position: absolute;
            top: 96%;
            left: 45%;
            width: 50%;
            color: white;
        }

        .codigo1 {
            font-size: 11px;
        }

        .firma1 {
            float: left;
            width: 30%;
        }

        .firma2 {
            float: right;
            width: 30%;
        }

        .nombre1 {
            float: left;
            width: 40%;
            color: black;
        }

        .nombre2 {
            float: right;
            width: 40%;
            color: black;
        }

        .fecha {
            font-size: 12px;
            color: black;
            float: right;
            padding-top: 10px;
        }

        .img_ecuador {
            width: 7%;
        }

        .img_yavi {
            width: 10%;
        }

        .hero-text_p {
            text-align: justify;
            margin-top: 15px;
        }

        .label_general {
            font-size: 16px;
            color: black;
        }

        .label_general_its {
            font-size: 28px;
            color: black;
            width: 50%;
            display: inline-block;
            padding-top: -20%;
            position: relative;
            font-weight: bold;
        }

        .label_general_p {
            font-size: 19px;
            color: black;
        }

        .label_nombre {
            font-size: 20px;
            font-weight: bold;
            color: black;
        }
    </style>
</head>

<body>



    <div class="hero-image" id="htmlData">
        <img src="{{ public_path('/pdf/img_dip/diploma.jpg')}}" alt="" style="
        height: 129%;
        ">
        <div class="header">
            <img src="{{ public_path('/pdf/img_dip/ecuador.png')}}" alt="" style="
                width: 10%;
                height: auto;
                margin-right: 80px;
            ">
            <label for="" class="label_general_its"> INSTITUTO SUPERIOR TECNOLÓGICO
                DE TURISMO Y PATRIMONIO
                "YAVIRAC
            </label>
            <img src="{{ public_path('/pdf/img_dip/yavi_text.png')}}" alt="" style="
                width: 13%;
                height: auto;
                margin-left: 80px;
            ">
        </div>
        <div class="hero-text">
            <p class="label_general" style="color: rgb(49, 122, 233); font-size: 25px; font-weight: bold;">DIPLOMA</p>
            <br>
            <label class="label_general">A: <label class="label_nombre">{{$names}} {{$lastnames}}</label></label>
            <div class="hero-text_p">
                <label class="label_general_p">Por haber participado como Instructor en el curso de {{$course_name}} del {{$start_date}} al {{$end_date}}. </label>
                <p class="fecha">D.M. De Quito, {{$date_today}}</p>
            </div>
        </div>
        <div class="firmas">
            <img src="{{ public_path('/pdf/img_dip/firma_rector.png')}}" alt="" class="firma1" style="
            width: 30%;
            height: auto;
            float: left;
            ">
            <img src="{{ public_path('/pdf/img_dip/firma_mauricio.png')}}" alt="" class="firma2" style="
            float: right;
            width: 30%;
            height: auto;
            ">

        </div>
        <div class="nombres">
            <p>
                <label for="" class="nombre1">{{$main_firm_name}}</label>
                <label for="" class="nombre2"> {{$second_firm_name}}</label>
            </p>
        </div>
        <div class="cargos">
            <p>
                <label for="" class="nombre1" style="font-weight: bold;">{{$main_position}}</label>
                <label for="" class="nombre2" style="font-weight: bold;">{{$second_position}}</label>
            </p>
        </div>
        <div class="codigo">
            <label for="" class="codigo1" style="font-weight: bold;">Código interno: {{$code_participant}}</label>
        </div>
    </div>


</body>

</html>