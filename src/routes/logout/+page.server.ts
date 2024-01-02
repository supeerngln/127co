import { redirect } from '@sveltejs/kit';
import type { Actions } from './$types';

export const actions: Actions = {
	default: async ({ cookies }) => {
        cookies.delete('auth-token', {path: '/'});
        cookies.delete('role', {path: '/'});
        throw redirect(302, '/');
	}
};
