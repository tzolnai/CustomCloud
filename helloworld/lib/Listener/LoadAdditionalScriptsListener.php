<?php

declare(strict_types=1);

namespace OCA\HelloWorld\Listener;

use OCP\EventDispatcher\Event;
use OCP\EventDispatcher\IEventListener;
use OCA\Files\Event\LoadAdditionalScriptsEvent;
use OCP\Util;

use OCA\HelloWorld\AppInfo\Application;

class LoadAdditionalScriptsListener implements IEventListener {
	public function handle(Event $event): void {
		if (!($event instanceof LoadAdditionalScriptsEvent)) {
			return;
		}

		Util::addInitScript(Application::APP_ID, 'files-action');
	}
}
