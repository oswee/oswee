import { css } from 'lit'

export default css`
	:host {
		display: flex;
		flex-direction: row;
	}

	:host([hidden]) {
		display: none;
	}

	.left {
		display: flex;
		flex-direction: row;
		align-items: center;
	}

	.middle {
		display: flex;
		flex: 1;
		flex-direction: row;
		align-items: center;
	}

	.right {
		display: flex;
		flex-direction: row;
		align-items: center;
	}
`
