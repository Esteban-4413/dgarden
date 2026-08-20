# HTML (HyperText Markup Language)

## Elements and tags

### What is HTML?
HTML defines the structure and content of a webpage. It is used to create all the paragraphs, headings, lists, images, and links that make up a typical site.

### HTML tags
Tags are the essential building blocks of a webpage. They tell the browser how to interpret the content.
- Opening tags: Tell the browser where an element starts. They consist of a keyword enclosed in angle brackets.
  - Example: `<p>`
- Closing tags: Tell the browser where an element ends. They are almost identical to opening tags, but they have a forward slash (`/`) before the keyword.
  - Example: `</p>`

### HTML elements 
You can think of elements as containers for content. A ful standard element consists of three parts:
1. Opening tag
2. Content (text or other elements)
3. Closing tag
```html
<p>some text content</p>
```

### Void elements
Some HTML elements do not have a closing tag because they cannot wrap content (there is nothing inside of them). They are known as void elements.
- Common examples: `<br>` (line break) or `<img>` (image).
- Self-closing tags: You might see these written with a forward slash at then end (e.g., `<img />`). While browsers will render them just fine for historical reasons, the latest version of HTML specifications discourages their use and considers them invalid. It's better to just use `<img>`.

### Semantic HTML (choosing the right tags)
HTML has a vast list of predefined tags. Using the correct tags for your content is called semantic HTML. This has a huge impact on two main aspects of your site:
1. SEO (search engine optimization): How well your site is ranked in search engines like DuckDuckGo.
2. Accessibility: How accessible your site is to users who rely on assistive technologies, like screen readers, to navigate the internet. 

## The HTML skeleton 
Every HTML page needs a standard skeleton (boilerplate) to work properly.

### Homepage file
The main file of your website should always be named `index.html`. Web servers automatically look for this specific file by default when a user visits your site.

### The DOCTYPE
```html 
<!DOCTYPE html>
```
- It must be the very first line of your file.
- It symply tells the browser to render the document using the latest version of HTML.

### The root element (`<html>`)
```html
<html lang="en">..</html>
```
-This is the root element. Every single element in your document must be a descendant of (nested inside) this tag.
- Attributes: Notice the `lang="en"`. Attributes provide extra information about an element. Here, it specifies that the language is English, which is crucial for accessibility (it helps screen readers pronounce words correctly).

### The `<head>` element
Contains meta-information and settings for the browser. Nothing inside the `<head>` is directly displayed on the actual webpage.
- `<meta charset="UTF-8">`: Extremely important. It ensures the browser correctly renders special characters and symbols from different languages.
- `<title>My webpage</title>`:Defines the text that appears up in the browser's tab. Without it, the tab would just show the ugly file name (like `index.html`).

### The `<body>` element
This is a container for all the visibe content. Everything you actually want the user to see on the screen—text, images, headings, lists—must be placed inside the `<body>`.

### The complete skeleton
```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>My First Webpage</title>
  </head>

  <body>
    <h1>Hello World!</h1>
  </body>
</html>
```

## Working with text in HTML
### Paragraphs (`<p>`)
When you type text directly into an HTML file and use the "Enter" key to create new lines, the browser will ignore those line breaks and compress everything into one long, single line (this is called whitespace collapse).
- To create actual paragraphs, you must wrap your text in the paragraph element: `<p>`
```html
<p>This is the first paragraph.</p>
<p>This is the second paragraph.</p>
```

### Headings (`<h1>` to `<h6>`)
Headings are used to create titles and subtitles. By default, the browser displays them larger and bolder than normal text.
- There are 6 levels of headings: `<h1>` (largest/most important) down to `<h6>` (smallest/least important).
- Hierarchy is important: `<h1>` should generally only be used once per page for the main title. Use `<h2>` for major sections, `<h3>` for subsections, and so on.
```html
<h1>Main Website Title</h1>
<h2>Section Title</h2>
<h3>Subsection Title</h3>
```

### Formatting with semantics (`<strong>` and `<em>`)
Sometimes you need to emphasize specific words inside a paragraph. HTML provides tags that not only change the visual appearance but also add semantic meaning (meaning that screen readers will change their tone of voice when reading them).
- `<strong>` (important): Makes text **bold** and marks it as highly important.
- `<em>` (Emphasis): Makes text *italic* and places emphasis on it.
```html
<p>This is a normal sentence, but <strong>this part is very important</strong>.</p>
<p>I <em>really</em> love learning HTML!</p>
```

### Nesting and relationships
When you place elements inside of other elements, it is called nesting. This creates a family-like relationship tree in your HTML:
- Parent: The element that contains another element.
- Child: The element nested directly inside the parent.
- Siblings: Elements that are at the exact same level of nesting (children of the same parent).

Indentation: To make these relationships easy to read for developers, we indent child elements (usually by 2 spaces or a tab).
```html
<body>
  <p>I am a child of body, and a sibling to the h1.</p>
  <h1>I am also a child of body, and a sibling to the p.</h1>
</body>
```
### HTML comments
Comments are notes left in the code for yourself or other developers.
- The browser completely ignores them, so they are invisible on the actual webpage.
- They start with `<!--` and close with `-->`
```html
<h1> View the html to see the hidden comments </h1>

<!-- I am an html comment -->

<p>Some paragraph text</p>

<!-- I am another html comment -->
```

## Lists
HTML provides specific elements to structure collections of items. There are two primary types of lists: Unordered Lists and Ordered Lists. Both rely on list item tags (`<li>`) for each entry.

### Unordered lists (`<ul>`)
Used when the order of items does not matter (e.g., a grocery shopping list or a collection of features).
- The container element is `<ul>` (Unordered List).
- Each individual item inside uses the `<li>` (List Item) element.
- By default, the browser renders each item preceded by a bullet point.

```html
<ul>
  <li>Apples</li>
  <li>Bananas</li>
  <li>Milk</li>
</ul>
```

### Ordered lists (`<ol>`)
Used when the order or sequence matters (e.g., step-by-step cooking instructions, top 10 rankings).

- The container element is `<ol>` (Ordered List).
- Just like unordered lists, individual entries use the `<li>` element.
- The browser automatically renders each item preceded by an incrementing number.

```html 
<ol>
  <li>Preheat the oven to 350°F</li>
  <li>Mix flour and sugar in a bowl</li>
  <li>Bake for 30 minutes</li>
</ul>
```

## Links and images
### Anchor elements (`<a>`)
Used to create hyperlinks that connect to other pages, files, or resources on the web.
- Defined using the `<a>` tag and wrapped around the text or element you want to turn into a link.
- `href` attribute: Specifies the destination URL or file path. Without it, the browser treats the text as plain text.
```html
<a href="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%2Fid%2FOIP.eVscrm4VACZRlfpaXCN4IAHaTw%3Fpid%3DApi&f=1&ipt=52e8fabc076f4b7779b5f20e26f934091000955cd9d5aa39f832e741f9900cd3&ipo=images">Cats</a>
```

### Opening links in a new tab
By default, links open in the current tab (`_self`). To change this behaviour:
- `target="_blank`: Tells the browser to open the resource in a new tab or window.
- `rel="noreferrer` / `rel="noopener`: Security attributes used in combination with `_blank` to prevent potential security vulnerabilities (such as tabnabbing) and protect user privacy
>[!question] What is tabnabbing?
>Tabnabbing is a computer exploit and phishing attack, which persuades users to submit their login details and passwords to popular websites by impersonating those sites and convincing the user that the site is genuine.
> via wikipedia
```html
<a href="https://www.google.com" target="_blank" rel="noreferrer">Google</a>
```

### Absolute vs. Relative links
Absolute links
- Links pointing to pages on other websites across the internet.
- Always contain the complete address layout: protocol (scheme), domain name, and path (`scheme://domain/path`).

Relative links
- Links pointing to pages within your own website.
- Do not include the domain name; they assume the site shares the same root domain.
- Path navigation:
  - Same directory: `<a href="about.html">About</a>` or `<a href="./about.html">About</a>`
  - Subdirectory: `<a href="./pages/about.html">About</a>`
  - Parent directory (stepping backwards): `<a href="../index.html">Home</a>`

### Image elements (`<img>`)
Used to embed pictures and graphics into a webpage.
- Void element: Does not require a closing tag (`<img>`).
- `src` attribute: Specifies the source location of the image (supports both absolute URLs and relative local paths) 
- `alt` attributes: Alternative text describing the image. Crucial for accessibility (screen readers) and displayed if the image fails to load.
- `height` and `width` attributes: Explicitly declare image dimensions to prevent layout shifts and page jumps while assets load.
```html
<img src="./images/dog.jpg" alt="A cute dog running in the park" height="300" width="400">
```
