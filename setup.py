from setuptools import setup, find_packages
from os import path

setup(
    name='tune_in',
    version='0.1.0',
    description='tune_in data analysis',
    long_description='', 
    long_description_content_type='text/markdown',
    url='',
    author='naveen bandi',
    author_email='naveen.bandi@ampersand.tv',
    classifiers=[
        'python',
        'tune_in',
        'athena',
    ],
    keywords='tune_in analysis',
    packages=['tune_in'],
    python_requires='>=3.5',
    install_requires=[
        'requests',
        'boto3',
        'pyathena'
    ],
    project_urls={},
)