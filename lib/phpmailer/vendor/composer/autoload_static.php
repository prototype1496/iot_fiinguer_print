<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit51d0f18507b5bc7c1ec597f5818a5119
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPMailer\\PHPMailer\\' => 20,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPMailer\\PHPMailer\\' => 
        array (
            0 => __DIR__ . '/..' . '/phpmailer/phpmailer/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit51d0f18507b5bc7c1ec597f5818a5119::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit51d0f18507b5bc7c1ec597f5818a5119::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
