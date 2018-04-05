#HTML

> **H**yper **T**ext **M**arkup **L**anguage
>
> The **skeleton** of websites



####Overview

A HTML document consists of organized groupings of elements dictating where "stuff" will go and i what order. Elements are declared with an opening and closing tag with it's content in between:

`<p>This is a paraphraph</p>`

From the tags we can apply a "style" to the view of the page using **CSS**:

`p { font-size: 16px; }`

HTML is organized as a collection of family tree relationship, including parent-child and siblings.

This is known as the *hierarchy*.



### Body

One of the key HTML elements - only content inside the body element can be displayed to the screen:

```html 
<body>
    *displayable_content
</body>
```

Inside the body we can display text, images, videos, buttons etc. to the user.



### Headings

Headings are used to get the readers attention, naming sections and seperating sections of text.

```html
<h1></h1> Biggest heading
<h2></h2>
...
<h6></h6> Smallest heading
```



### Divs

A <`div>` is short for "division". They're used as containers that can divide the page into sections. These sections are very useful for grouping elements together.

```html
<div></div>
```



### Attributes

Attributes are content added to the opening tag of an element:

```html
<div id="intro"> <!-- The id along with it's value is an attribute -->
    <h1>Some Heading</h1>
</div>
```

Attributes can used in several different ways, from providing information to changing the styling of the content.

An attribute has two parts - **a name and a value**.



### Text

When you want to display text to the user, mainly two tags are used - `<p>` and `<span>`.





###Summery

```html
<head>     
</head>
<body> <!-- content in the body will be displayed to the user -->
  <h1>The Brown Bear</h1> <!-- heading -->
  <div id="introduction"> <!-- div with an attribute -->
    <h2>About Brown Bears</h2>
    <p>The brown bear (<em>Ursus arctos</em>) is native to parts of northern Eurasia and North America. Its conservation status is currently <strong>Least Concern</strong>. <br><br> There are many subspecies within the brown bear species, including the Atlas bear and the Himalayan brown bear.</p>
    <h3>Species</h3>
    <h3>Features</h3>
    <p>Brown bears are not always completely brown. Some can be reddish or yellowish. They have very large, curved claws and huge paws. Male brown bears are often 30% larger than female brown bears. They can range from 5 feet to 9 feet from head to toe.</p>
  </div>
  <div id="media">
    <h2>Media</h2>
  </div>
</body>
```





- **HTML** stands for **H**yper**T**ext **M**arkup **L**anguage and is used to create the structure and content of a webpage.
- Most HTML elements contain opening and closing tags with raw text or other HTML tags between them.
- HTML elements can be nested inside other elements. The enclosed element is the child of the enclosing parent element.
- Any visible content should be placed within the opening and closing `<body>` tags .
- Headings and sub-headings, `<h1>` to `<h6>` tags, are used to enlarge text.
- `<p>`, `<span>` and `<div>` tags specify text or blocks.
- The `<em>` and `<strong>` tags are used to emphasize text.
- Line breaks are created with the `<br>` tag.
- Ordered lists (`<ol>`) are numbered and unordered lists (`<ul>`) are bulleted.
- Images (`<img>`) and videos (`<video>`) can be added by linking to an existing source.