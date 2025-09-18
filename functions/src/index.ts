import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();
const messaging = admin.messaging();

export const onSetPublished = functions.firestore
  .document('sets/{setId}')
  .onUpdate(async (change, ctx) => {
    const before = change.before.data();
    const after = change.after.data();
    if (!before?.isPublished && after?.isPublished) {
      const title = after.title as string;
      await messaging.send({
        topic: 'new-sets',
        notification: { title: 'New DJ set', body: title ?? 'New upload' },
        data: { setId: ctx.params.setId },
      });
    }
  });

export const subscribeEmail = functions.https.onCall(async (data, context) => {
  const email = (data?.email ?? '').toString().trim().toLowerCase();
  if (!email || !email.includes('@')) {
    throw new functions.https.HttpsError('invalid-argument', 'Invalid email');
  }
  await admin.firestore().collection('subscriptions').doc(email).set({
    createdAt: admin.firestore.FieldValue.serverTimestamp(),
    verified: false
  }, { merge: true });
  // TODO: Send verification email via SendGrid or Mailchimp
  return { ok: true };
});
