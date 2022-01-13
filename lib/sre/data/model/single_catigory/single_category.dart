import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

// String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    CategoryModel(   {
        this.status,
        this.count,
        this.countTotal,
        this.pages,
        this.category,
        this.posts,
  });

    final bool? status;
    final int? count;
    final int? countTotal;
    final int? pages;
    final Category? category;
    final List<Post>? posts;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        count: json["count"],
        countTotal: json["count_total"],
        pages: json["pages"],
        category: Category.fromJson(json["category"]),
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "status": status,
    //     "count": count,
    //     "count_total": countTotal,
    //     "pages": pages,
    //     "category": category!.toJson(),
    //     // "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
    // };
}

class Category {
    Category({
        this.id,
        this.slug,
        this.name,
        this.description,
        this.parent,
        this.postCount,
        this.termId,
        this.url,
        this.taxonomy,
        this.categoryFollowers,
        this.followers,
        this.categories,
    });

    final int? id;
    final String? slug;
    final String? name;
    final String? description;
    final int? parent;
    final int? postCount;
    final int? termId;
    final String? url;
    final String? taxonomy;
    final int? categoryFollowers;
    final List<String>? followers;
    final List<dynamic>? categories;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        description: json["description"],
        parent: json["parent"] == null ? null : json["parent"],
        postCount: json["post_count"],
        termId: json["term_id"],
        url: json["url"],
        taxonomy: json["taxonomy"],
        categoryFollowers: json["category_followers"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        categories: json["categories"] == null ? null : List<dynamic>.from(json["categories"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "description": description,
        "parent": parent == null ? null : parent,
        "post_count": postCount,
        "term_id": termId,
        "url": url,
        "taxonomy": taxonomy,
        "category_followers": categoryFollowers,
        "followers": List<dynamic>.from(followers!.map((x) => x)),
        "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x)),
    };
}

class Post {
    Post({
        this.id,
        this.type,
        this.slug,
        this.url,
        this.status,
        this.title,
        this.titlePlain,
        this.content,
        this.excerpt,
        this.date,
        this.modified,
        this.categories,
        this.tags,
        this.author,
        this.attachments,
        this.commentStatus,
        this.customFields,
        this.share,
        this.favorite,
        this.polled,
    });

    final int? id;
    final String? type;
    final String? slug;
    final String? url;
    final String? status;
    final String? title;
    final String? titlePlain;
    final String? content;
    final String? excerpt;
    final String? date;
    final String? modified;
    final List<Category>? categories;
    final List<Category>? tags;
    final Author? author;
    final List<dynamic>? attachments;
    final String? commentStatus;
    final CustomFields? customFields;
    final String? share;
    final bool? favorite;
    final bool? polled;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        type: json["type"],
        slug: json["slug"],
        url: json["url"],
        status: json["status"],
        title: json["title"],
        titlePlain: json["title_plain"],
        content: json["content"],
        excerpt: json["excerpt"],
        date: json["date"],
        modified: json["modified"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        tags: List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
        author: Author.fromJson(json["author"]),
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        commentStatus: json["comment_status"],
        customFields: CustomFields.fromJson(json["custom_fields"]),
        share: json["share"],
        favorite: json["favorite"],
        polled: json["polled"],
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "type": type,
    //     "slug": slug,
    //     "url": url,
    //     "status": status,
    //     "title": title,
    //     "title_plain": titlePlain,
    //     "content": content,
    //     "excerpt": excerpt,
    //     "date": date,
    //     "modified": modified,
    //     "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    //     "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
    //     "author": author!.toJson(),
    //     "attachments": List<dynamic>.from(attachments!.map((x) => x)),
    //     "comment_status": commentStatus,
    //     "custom_fields": customFields!.toJson(),
    //     "share": share,
    //     "favorite": favorite,
    //     "polled": polled,
    // };
}

class Author {
    Author({
        this.id,
        this.slug,
        this.name,
        this.firstName,
        this.lastName,
        this.nickname,
        this.url,
        this.description,
        this.avatar,
        this.verified,
        this.badge,
        this.profileCredential,
    });

    final int? id;
    final String? slug;
    final String? name;
    final String? firstName;
    final String? lastName;
    final String? nickname;
    final String? url;
    final String? description;
    final String? avatar;
    final bool? verified;
    final Badge? badge;
    final String? profileCredential;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        nickname: json["nickname"],
        url: json["url"],
        description: json["description"],
        avatar: json["avatar"],
        verified: json["verified"],
        badge: Badge.fromJson(json["badge"]),
        profileCredential: json["profile_credential"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "nickname": nickname,
        "url": url,
        "description": description,
        "avatar": avatar,
        "verified": verified,
        "badge": badge!.toJson(),
        "profile_credential": profileCredential,
    };
}

class Badge {
    Badge({
        this.name,
        this.color,
        this.textColor,
        this.textColorDark,
    });

    final String? name;
    final String? color;
    final String? textColor;
    final String? textColorDark;

    factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        name: json["name"],
        color: json["color"],
        textColor: json["textColor"],
        textColorDark: json["textColorDark"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "color": color,
        "textColor": textColor,
        "textColorDark": textColorDark,
    };
}

class CustomFields {
    CustomFields({
        this.questionVote,
        this.postStats,
        this.commentCount,
    });



    final List<String>? questionVote;
    final List<String>? postStats;
    final List<String>? commentCount;

    // final List<String>? postCountAll;
    // final List<String>? postCountComments;

    factory CustomFields.fromJson(Map<String, dynamic> json) => CustomFields(
        questionVote: List<String>.from(json["question_vote"].map((x) => x)),
        postStats: List<String>.from(json["post_stats"].map((x) => x)),
        commentCount: List<String>.from(json["comment_count"].map((x) => x)),
    );}

class Ask {
    Ask({
        this.title,
        this.id,
    });

    final String? title;
    final String? id;

    factory Ask.fromJson(Map<String, dynamic> json) => Ask(
        title: json["title"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
    };
}

class WpqaPoll {
    WpqaPoll({
        this.title,
        this.id,
        this.value,
        this.userIds,
    });

    final String? title;
    final String? id;
    final int? value;
    final List<int>? userIds;

    factory WpqaPoll.fromJson(Map<String, dynamic> json) => WpqaPoll(
        title: json["title"] == null ? null : json["title"],
        id: json["id"],
        value: json["value"],
        userIds: List<int>.from(json["user_ids"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "id": id,
        "value": value,
        "user_ids": List<dynamic>.from(userIds!.map((x) => x)),
    };
}