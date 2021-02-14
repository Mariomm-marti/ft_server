<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'default_8z3p5mjTn2cL0Ipk' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '[D~,Qo]2|9$x7^Jx4RbE)%kz $Ue p}bhroIUL]ZUV.tMUR$1o!(jueUQ*{J))2#' );
define( 'SECURE_AUTH_KEY',  'e!<_L;SQ}Vy!p$IF`>9FNdD1e5%j=,M Nk87A9ZAo`S/yZ!8@(%1U_#@51Z[p#~o' );
define( 'LOGGED_IN_KEY',    '~eb~^/8_pE9hl2;g~Gk+Hl^cFAA%-/TyAgu/G$pCks 6*gq=]QutR<6QnO8eY`9b' );
define( 'NONCE_KEY',        '6?*:%ltYhY_SuS!z_;r0?(eQecG?0f:TqpBV %/z_C@c*Rf2K7L`W>!is?MxOC2e' );
define( 'AUTH_SALT',        'Eq7rk>xIFosu@gf`a:~XMS7yQV.L+COL2z@X9EX3+SY:tN6G1`pU&S<8l06F[qpb' );
define( 'SECURE_AUTH_SALT', 'YOY>N$86=?)-o{a0M+:bFVsMZ]!g2Cq*q`q|wZU_-(_]`$R3w>UFNh Z07Vg^EuB' );
define( 'LOGGED_IN_SALT',   'fv+EwU!N2c@6|*3_.K#eZ:#&,3W*doCWY4HO86bBVgZGR9oyajUV2u_,QX9&Ex*4' );
define( 'NONCE_SALT',       'mw(NQ$htOuE4bqCI[44W_(dL|eG>qdIFVdcAeH{1}isr76GzDTWq&U7oPO~X+9eD' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );

