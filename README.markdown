[![Build Status](https://travis-ci.org/dobryakov/teknavo-blog.svg?branch=master)](https://travis-ci.org/dobryakov/teknavo-blog)
[![Code Climate](https://codeclimate.com/github/dobryakov/teknavo-blog/badges/gpa.svg)](https://codeclimate.com/github/dobryakov/teknavo-blog)

About
-----------------

This is a typical blog application written as code challenge for Teknavo.

Features
-----------------

1. Simple blog with articles.
2. The article body should be written and rendered with Markdown.
3. Articles should have comments.
4. Visitors should be able to subscribe to the site with their email.
5. Each time an article is posted, subscribers should be sent a notification.
6. Each email should contain a link to the article and another to unsubscribe.
7. Front-end styling and interaction.
8. Asynchronous email delivery.

How it works?
-----------------

After somebody post the article (after_create Article model) the system publishes async event to process.

At the next step, the worker (actually ArticleCreatedJob) receives this event, get all subscribed users and send them emails (through async mailer) with link to article and unsubscribe link.

