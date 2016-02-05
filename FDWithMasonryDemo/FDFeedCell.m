//
//  FDFeedCell.m
//  Demo
//
//  Created by sunnyxx on 15/4/17.
//  Copyright (c) 2015年 forkingdog. All rights reserved.
//

#import "FDFeedCell.h"
#import "Masonry.h"

@interface FDFeedCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation FDFeedCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).offset(16);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.top.equalTo(self.contentView.mas_top).offset(10);
        }];
        
        [self.contentView addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_left).offset(0);
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(6);
        }];
        
        [self.contentLabel addSubview:self.contentImageView];
        [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_left).offset(0);
            make.right.lessThanOrEqualTo(self.contentView.mas_right).offset(-16);
            make.top.equalTo(self.contentLabel.mas_bottom).offset(8);
        }];
        
        [self.contentLabel addSubview:self.usernameLabel];
        [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_left).offset(0);
            make.top.equalTo(self.contentImageView.mas_bottom).offset(8);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-4);
        }];
        
        [self.contentView addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.baseline.equalTo(self.usernameLabel.mas_baseline).offset(0);
        }];
    }
    return self;
}
- (void)setEntity:(FDFeedEntity *)entity
{
    _entity = entity;
    
    self.titleLabel.text = entity.title;
    self.contentLabel.text = entity.content;
    self.contentImageView.image = entity.imageName.length > 0 ? [UIImage imageNamed:entity.imageName] : nil;
    self.usernameLabel.text = entity.username;
    self.timeLabel.text = entity.time;
}

// If you are not using auto layout, override this method, enable it by setting
// "fd_enforceFrameLayout" to YES.
//- (CGSize)sizeThatFits:(CGSize)size {
//    CGFloat totalHeight = 0;
//    totalHeight += [self.titleLabel sizeThatFits:size].height;
//    totalHeight += [self.contentLabel sizeThatFits:size].height;
//    totalHeight += [self.contentImageView sizeThatFits:size].height;
//    totalHeight += [self.usernameLabel sizeThatFits:size].height;
//    totalHeight += 40; // margins
//    return CGSizeMake(size.width, totalHeight);
//}
#pragma mark getters
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor blueColor];
    }
    return _titleLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textColor = [UIColor grayColor];
    }
    return _contentLabel;
}
-(UIImageView *)contentImageView{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc] init];
    }
    return _contentImageView;
}
-(UILabel *)usernameLabel{
    if (!_usernameLabel) {
        _usernameLabel = [[UILabel alloc] init];
        _usernameLabel.font = [UIFont systemFontOfSize:13];
        _usernameLabel.textColor = [UIColor grayColor];
    }
    return _usernameLabel;
}
-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = [UIColor cyanColor];
    }
    return _timeLabel;
}
@end
