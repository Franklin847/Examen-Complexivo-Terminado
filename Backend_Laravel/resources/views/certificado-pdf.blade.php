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
            top: 36%;
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
            top: 64%;
            left: 25%;
            width: 50%;
            color: white;
        }


        .nombres {
            text-align: center;
            position: absolute;
            top: 72%;
            left: 20%;
            width: 60%;
            color: white;
            font-size: 15px;
        }

        .cargos {
            text-align: center;
            position: absolute;
            top: 75%;
            left: 20%;
            width: 60%;
            color: white;
            font-size: 15px;
        }

        .codigo {
            text-align: right;
            position: absolute;
            top: 80%;
            left: 42%;
            width: 50%;
        }

        .codigo1 {
            text-align: left;
            position: absolute;
            top: 84%;
            left: 10%;
            width: 30%;
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
            font-size: 22px;
            color: #484747;
            margin-top: -20px;
            font-weight: bold;
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
            font-size: 20px;
            color: #484747;
        }

        .label_nombre {
            font-size: 28px;
            font-weight: bold;
            color: #484747;
            margin-top: -10px;
        }

        .label_nombre_persona {
            font-size: 30px;
            font-weight: bold;
            font-family: "Homer Simpson UI";
            color: black;
            margin-top: -15px;
        }
    </style>
</head>

<body>



    <div class="hero-image" id="htmlData">
        <img src="{{ public_path('/pdf/img_cert/fondo_certificado.jpg')}}" alt="" style="
        height: 129%;
        ">

        <div class="hero-text">
            <img src="{{ public_path('/pdf/img_dip/yavi_text.png')}}" alt="" style="
                width: 15%;
                height: auto;
                margin-left: 10px;
            ">
            <br>
            <p class="label_nombre">CERTIFICA</p>
            <p class="label_general">A:</p>
            <p class="label_nombre_persona">{{$name}} {{$lastname}} </p>
            <div class="hero-text_p">
                <label class="label_general_p">Por haber aprobado el curso de capacitación de: <label style="font-weight: bold;"> “{{$course_name}}” </label> realizado en el {{$site_course}} del {{$start_date}} al {{$end_date}}, con una duración de {{$duration}} horas. </label>

            </div>
        </div>
        <div class="firmas">
            <img src="{{ public_path('/pdf/img_cert/firma_rector.png')}}" alt="" class="firma1" style="
            width: 23%;
            height: auto;
            float: left;
            ">
            <img src="{{ public_path('/pdf/img_cert/firma_jessica.jpg')}}" alt="" class="firma2" style="
            float: right;
            width: 23%;
            height: auto;
            ">

        </div>
        <div class="nombres">
            <p>
                <label for="" class="nombre1">{{$main_firm_name}}</label>
                <label for="" class="nombre2"> {{$second_firm_name}} </label>
            </p>
        </div>
        <div class="cargos">
            <p>
                <label for="" class="nombre1" style="font-weight: bold;">{{$main_position}} IST "YAVIRAC"</label>
                <label for="" class="nombre2" style="font-weight: bold;">{{$second_position}}</label>
            </p>
        </div>
        <div class="codigo">
            <img src="{{ public_path('/pdf/img_cert/gobierno.png')}}" alt="" class="firma2" style="
            float: right;
            width: 48%;
            height: auto;
            ">
        </div>
        <div class="codigo1">
            <label for="" class="" style="font-weight: bold; font-size: 14px;">Quito DM, {{$date_today}}</label>
            <p style="font-size: 12px; margin-top: 1px;">Registro SENESCYT No.</p>
            <p style="font-size: 12px; margin-top: -8px;">{{$code_participant}}</p>
        </div>
    </div>


</body>

</html>