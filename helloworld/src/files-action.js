import { registerFileAction } from '@nextcloud/files'

registerFileAction({
	id: 'helloworld-hello',
	displayName: () => 'Hello World',
	iconSvgInline: () => `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30"><text x="2" y="18">HW</text></svg>`,

	enabled: ({ nodes }) => nodes.length === 1,

    async exec({ nodes: [node] }) {
		alert(`Hello World: ${node.basename}`)
        return true
    },
})
