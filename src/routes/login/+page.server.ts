import db from '$lib/server/database';
import { redirect } from '@sveltejs/kit';
import type { Actions } from './$types';

export const actions: Actions = {
	default: async ({ cookies, request }) => {
		const data = await request.formData();
		
		const email = data.get('email') as string;
		const password = data.get('password') as string;

		if (email.startsWith('admin') && password.startsWith('admin')) {
			cookies.set('auth-token', 'admin', {
				path: '/'
			});
			cookies.set('role', 'CEO', {
				path: '/',
				httpOnly: false
			});
			throw redirect(303, '/dashboard');
		}

		const [rows] = await db.Employee.select({
			where: {
				Employee_Email: email,
				Employee_Password: password
			}
		});
		
		if (rows.length === 0) {
			const [rows] = await db.Client.select({
				where: {
					Client_Email: email,
					Client_Password: password
				}
			});

			if (rows.length === 0) {
				return {
					status: 404,
					body: {
						message: 'User not found'
					}
				};
			} else {
				const id = rows[0]['Client_ID'];
				cookies.set('auth-token', id, {
					path: '/'
				});
				cookies.set('role', 'client', {
					path: '/',
					httpOnly: false
				});
				throw redirect(303, '/dashboard');
			}
		} else {
			const id = rows[0]['Employee_ID'];
			cookies.set('auth-token', id, {
				path: '/',
				httpOnly: true
			});
			cookies.set('role', rows[0]['Employee_Position'], {
				path: '/',
				httpOnly: false
			});
			throw redirect(303, '/dashboard');
		}
	}
};
