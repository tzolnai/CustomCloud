<?php

declare(strict_types=1);

namespace OCA\HelloWorld\AppInfo;

use OCP\AppFramework\App;
use OCP\AppFramework\Bootstrap\IBootContext;
use OCP\AppFramework\Bootstrap\IBootstrap;
use OCP\AppFramework\Bootstrap\IRegistrationContext;

use OCA\Files\Event\LoadAdditionalScriptsEvent;

use OCA\HelloWorld\Listener\LoadAdditionalScriptsListener;

class Application extends App implements IBootstrap {
	public const APP_ID = 'helloworld';

	public function __construct() {
		parent::__construct(self::APP_ID);
	}

	public function register(IRegistrationContext $context): void {
		$context->registerEventListener(
			LoadAdditionalScriptsEvent::class,
			LoadAdditionalScriptsListener::class
		);
	}

	public function boot(IBootContext $context): void {
	}
}
